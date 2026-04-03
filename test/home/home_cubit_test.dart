import 'package:countries/features/home/domain/entities/entities.dart';
import 'package:countries/features/home/domain/usecases/get_countries_api.dart';
import 'package:countries/features/home/domain/usecases/get_countries_local.dart';
import 'package:countries/features/home/logic/home_cubit.dart';
import 'package:countries/networking/api_result.dart' hide Error;
import 'package:countries/networking/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_cubit_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GetCountriesRemoteHomeUseCase>(),
  MockSpec<GetCountriesLocalHomeUseCase>(),
])
void main() {
  late HomeCubit homeCubit;
  late MockGetCountriesRemoteHomeUseCase mockRemoteUseCase;
  late MockGetCountriesLocalHomeUseCase mockLocalUseCase;

  setUp(() {
    mockRemoteUseCase = MockGetCountriesRemoteHomeUseCase();
    mockLocalUseCase = MockGetCountriesLocalHomeUseCase();
    homeCubit = HomeCubit(
      getcountriesRemoteUseCase: mockRemoteUseCase,
      getCountriesLocalHomeUseCase: mockLocalUseCase,
    );
  });

  tearDown(() {
    homeCubit.close();
  });

  // Helper function to create test countries
  List<Country> createTestCountries() {
    return [
      const Country(
        name: 'Jordan',
        capital: 'Amman',
        cca2: 'JO',
        cca3: 'JOR',
        callingCodes: ['+962'],
        languages: [
          {'eng': 'English'},
        ],
      ),
      const Country(
        name: 'Egypt',
        capital: 'Cairo',
        cca2: 'EG',
        cca3: 'EGY',
        callingCodes: ['+20'],
        languages: [
          {'ara': 'Arabic'},
        ],
      ),
      const Country(
        name: 'Lebanon',
        capital: 'Beirut',
        cca2: 'LB',
        cca3: 'LBN',
        callingCodes: ['+961'],
        languages: [
          {'ara': 'Arabic', 'fra': 'French'},
        ],
      ),
    ];
  }

  group('HomeCubit Tests', () {
    group('getHomeData()', () {
      test('should emit loading then loaded with local source when cache exists', () async {
        final data = createTestCountries();

        when(mockRemoteUseCase.call(any)).thenAnswer((_) async => ApiResult.success(data));
        when(mockLocalUseCase.call()).thenAnswer((_) async => data);

        final future = expectLater(
          homeCubit.stream,

          emitsInOrder([isA<Loading>(), isA<Loaded>().having((l) => l.modeles, "data", data)]),
        );

        homeCubit.getHomeData();
        await future;
      });

      test('should emit loading then loaded with remote source when no cache exists', () async {
        // Arrange
        final remoteCountries = createTestCountries();
        when(mockLocalUseCase.call()).thenAnswer((_) async => null);
        when(
          mockRemoteUseCase.call(any),
        ).thenAnswer((_) async => ApiResult.success(remoteCountries, source: DataSource.remote));

        // Act
        await homeCubit.getHomeData();

        // Assert
        expect(
          homeCubit.state,
          isA<Loaded>()
              .having((s) => s.modeles, 'countries', remoteCountries)
              .having((s) => s.source, 'source', DataSource.remote),
        );
      });

      test('should emit error when no cache and remote fails', () async {
        // Arrange
        when(mockLocalUseCase.call()).thenAnswer((_) async => null);
        when(
          mockRemoteUseCase.call(any),
        ).thenAnswer((_) async => const ApiResult.error(Failure.network()));

        // Act
        await homeCubit.getHomeData();

        // Assert
        expect(
          homeCubit.state,
          isA<HomeState>().having(
            (s) => s.maybeWhen(error: (_) => true, orElse: () => false),
            'is error',
            true,
          ),
        );
      });

      test('should update to remote source when cache exists and remote succeeds', () async {
        // Arrange
        final cachedCountries = createTestCountries();
        final remoteCountries = [
          ...cachedCountries,
          const Country(name: 'Syria', capital: 'Damascus', cca2: 'SY', cca3: 'SYR'),
        ];
        when(mockLocalUseCase.call()).thenAnswer((_) async => cachedCountries);
        when(
          mockRemoteUseCase.call(any),
        ).thenAnswer((_) async => ApiResult.success(remoteCountries, source: DataSource.remote));

        // Act
        await homeCubit.getHomeData();

        // Wait for remote call

        // Assert - should eventually have remote data
        expect(homeCubit.state, isA<Loaded>().having((s) => s.source, 'source', DataSource.remote));
      });

      test('should keep local data when cache exists but remote fails', () async {
        // Arrange
        final cachedCountries = createTestCountries();
        when(mockLocalUseCase.call()).thenAnswer((_) async => cachedCountries);
        when(
          mockRemoteUseCase.call(any),
        ).thenAnswer((_) async => const ApiResult.error(Failure.network()));

        // Act
        await homeCubit.getHomeData();

        // Assert - should still have local data
        expect(
          homeCubit.state,
          isA<Loaded>()
              .having((s) => s.modeles, 'countries', cachedCountries)
              .having((s) => s.source, 'source', DataSource.local),
        );
      });
    });

    group('search()', () {
      test('should filter countries by name when query is provided', () async {
        // Arrange
        final countries = createTestCountries();
        when(mockLocalUseCase.call()).thenAnswer((_) async => countries);
        when(
          mockRemoteUseCase.call(any),
        ).thenAnswer((_) async => ApiResult.success(countries, source: DataSource.remote));
        await homeCubit.getHomeData();

        // Act
        homeCubit.search('Jor');

        // Assert
        expect(
          homeCubit.state,
          isA<Loaded>()
              .having((s) => s.modeles.length, 'filtered count', 1)
              .having((s) => s.modeles.first.name, 'first country name', 'Jordan'),
        );
      });

      test('should show all countries when query is empty', () async {
        // Arrange
        final countries = createTestCountries();
        when(mockLocalUseCase.call()).thenAnswer((_) async => countries);
        when(
          mockRemoteUseCase.call(any),
        ).thenAnswer((_) async => ApiResult.success(countries, source: DataSource.remote));
        await homeCubit.getHomeData();

        // Act
        homeCubit.search('');

        // Assert
        expect(
          homeCubit.state,
          isA<Loaded>().having((s) => s.modeles.length, 'all countries count', countries.length),
        );
      });

      test('should return empty list when no matches found', () async {
        // Arrange
        final countries = createTestCountries();
        when(mockLocalUseCase.call()).thenAnswer((_) async => countries);
        when(
          mockRemoteUseCase.call(any),
        ).thenAnswer((_) async => ApiResult.success(countries, source: DataSource.remote));
        await homeCubit.getHomeData();

        // Act
        homeCubit.search('NonExistentCountry');

        // Assert
        expect(homeCubit.state, isA<Loaded>().having((s) => s.modeles.length, 'empty list', 0));
      });

      test('should preserve DataSource when searching', () async {
        // Arrange
        final countries = createTestCountries();
        when(mockLocalUseCase.call()).thenAnswer((_) async => countries);
        when(
          mockRemoteUseCase.call(any),
        ).thenAnswer((_) async => ApiResult.success(countries, source: DataSource.local));
        await homeCubit.getHomeData();

        // Act
        homeCubit.search('Jor');

        // Assert
        expect(homeCubit.state, isA<Loaded>().having((s) => s.source, 'source', DataSource.local));
      });
    });

    group('setFilter()', () {
      test('should filter by Name when filter is null', () async {
        // Arrange
        final countries = createTestCountries();
        when(mockLocalUseCase.call()).thenAnswer((_) async => countries);
        when(
          mockRemoteUseCase.call(any),
        ).thenAnswer((_) async => ApiResult.success(countries, source: DataSource.remote));
        await homeCubit.getHomeData();

        // Act
        homeCubit.setFilter(null);
        homeCubit.search('Jor');

        // Assert
        expect(
          homeCubit.state,
          isA<Loaded>().having((s) => s.modeles.first.name, 'filtered by name', 'Jordan'),
        );
      });

      test('should filter by Code when filter is Code', () async {
        // Arrange
        final countries = createTestCountries();
        when(mockLocalUseCase.call()).thenAnswer((_) async => countries);
        when(
          mockRemoteUseCase.call(any),
        ).thenAnswer((_) async => ApiResult.success(countries, source: DataSource.remote));
        await homeCubit.getHomeData();

        // Act
        homeCubit.setFilter('Code');
        homeCubit.search('JO');

        // Assert
        expect(
          homeCubit.state,
          isA<Loaded>().having((s) => s.modeles.first.cca2, 'filtered by code', 'JO'),
        );
      });

      test('should filter by Capital when filter is Capital', () async {
        // Arrange
        final countries = createTestCountries();
        when(mockLocalUseCase.call()).thenAnswer((_) async => countries);
        when(
          mockRemoteUseCase.call(any),
        ).thenAnswer((_) async => ApiResult.success(countries, source: DataSource.remote));
        await homeCubit.getHomeData();

        // Act
        homeCubit.setFilter('Capital');
        homeCubit.search('Amm');

        // Assert
        expect(
          homeCubit.state,
          isA<Loaded>().having((s) => s.modeles.first.capital, 'filtered by capital', 'Amman'),
        );
      });

      test('should filter by Language when filter is Language', () async {
        // Arrange
        final countries = createTestCountries();
        when(mockLocalUseCase.call()).thenAnswer((_) async => countries);
        when(
          mockRemoteUseCase.call(any),
        ).thenAnswer((_) async => ApiResult.success(countries, source: DataSource.remote));
        await homeCubit.getHomeData();

        // Act
        homeCubit.setFilter('Language');
        homeCubit.search('Eng');

        // Assert
        expect(
          homeCubit.state,
          isA<Loaded>().having((s) => s.modeles.length, 'filtered by language', greaterThan(0)),
        );
      });

      test('should clear filter when same filter is set again', () async {
        // Arrange
        final countries = createTestCountries();
        when(mockLocalUseCase.call()).thenAnswer((_) async => countries);
        when(
          mockRemoteUseCase.call(any),
        ).thenAnswer((_) async => ApiResult.success(countries, source: DataSource.remote));
        await homeCubit.getHomeData();

        // Act
        homeCubit.setFilter('Code');
        homeCubit.setFilter('Code'); // Setting same filter should clear it

        // Assert - should show all countries
        expect(
          homeCubit.state,
          isA<Loaded>().having((s) => s.modeles.length, 'all countries', countries.length),
        );
      });

      test('should preserve DataSource when filtering', () async {
        // Arrange
        final countries = createTestCountries();
        when(mockLocalUseCase.call()).thenAnswer((_) async => countries);
        when(
          mockRemoteUseCase.call(any),
        ).thenAnswer((_) async => ApiResult.success(countries, source: DataSource.local));
        await homeCubit.getHomeData();

        // Act
        homeCubit.setFilter('Name');
        homeCubit.search('Jor');

        // Assert
        expect(homeCubit.state, isA<Loaded>().having((s) => s.source, 'source', DataSource.local));
      });
    });

    group('normalizeNumber()', () {
      test('should remove special characters', () {
        // Arrange & Act
        final result = homeCubit.normalizeNumber('+962 79 123-4567');

        // Assert
        expect(result, '962791234567');
      });

      test('should remove "00" prefix', () {
        // Arrange & Act
        final result = homeCubit.normalizeNumber('00962791234567');

        // Assert
        expect(result, '962791234567');
      });

      test('should handle empty string', () {
        // Arrange & Act
        final result = homeCubit.normalizeNumber('');

        // Assert
        expect(result, '');
      });

      test('should handle string with only special characters', () {
        // Arrange & Act
        final result = homeCubit.normalizeNumber('+-() ');

        // Assert
        expect(result, '');
      });
    });

    group('States', () {
      test('should start with initial state', () {
        // Assert
        expect(homeCubit.state, const HomeState.initial());
      });

      test('should emit loading state when getHomeData is called', () async {
        // Arrange
        when(mockLocalUseCase.call()).thenAnswer((_) async => null);
        when(
          mockRemoteUseCase.call(any),
        ).thenAnswer((_) async => const ApiResult.success([], source: DataSource.remote));

        // Act & Assert
        final future = expectLater(homeCubit.stream, emitsInOrder([isA<Loading>(), isA<Loaded>()]));

        await homeCubit.getHomeData();
        await future;
      });

      test('should emit loaded state with correct source', () async {
        // Arrange
        final countries = createTestCountries();
        when(mockLocalUseCase.call()).thenAnswer((_) async => null);
        when(
          mockRemoteUseCase.call(any),
        ).thenAnswer((_) async => ApiResult.success(countries, source: DataSource.remote));

        // Act
        await homeCubit.getHomeData();

        // Assert
        expect(homeCubit.state, isA<Loaded>().having((s) => s.source, 'source', DataSource.remote));
      });

      test('should emit error state when API fails', () async {
        // Arrange
        when(mockLocalUseCase.call()).thenAnswer((_) async => null);
        when(
          mockRemoteUseCase.call(any),
        ).thenAnswer((_) async => const ApiResult.error(Failure.network()));

        // Act
        await homeCubit.getHomeData();

        // Assert
        expect(
          homeCubit.state,
          isA<HomeState>().having(
            (s) => s.maybeWhen(error: (_) => true, orElse: () => false),
            'is error',
            true,
          ),
        );
      });
    });
  });
}
