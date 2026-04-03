import 'dart:convert';

import 'package:countries/features/home/data/data_source/local_home_data_source.dart';
import 'package:countries/features/home/data/data_source/remote_home_data_source.dart';
import 'package:countries/features/home/data/repos/home_repos_impl.dart';
import 'package:countries/features/home/logic/home_cubit.dart';
import 'package:countries/networking/api_result.dart';
import 'package:countries/networking/failure.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Dio>()])
void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  //------------------------------------------------------------
  //------------------------------------------------------------
  late SharedPreferences pref;
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    pref = await SharedPreferences.getInstance();
  });

  group("HomeRepository Tests", () {
    //--------------------------------------------------------------------
    //!  Remote Success
    //--------------------------------------------------------------------
    test("Should return ApiResult.success(remote) when API succeeds", () async {
      final mockDio = MockDio();

      when(mockDio.options).thenReturn(BaseOptions());

      when(mockDio.fetch<List<dynamic>>(any)).thenAnswer((_) async {
        return Response<List<dynamic>>(
          requestOptions: RequestOptions(),
          data: [
            {"name": "Jordan", "capital": "Amman", "cca2": "JO", "cca3": "JOR"},
          ],
        );
      });

      final repo = HomeRepositoryImpl(
        api: RemoteHomeDataSource(mockDio),
        localDataSource: LocalCountryHomeDataSource(pref: pref),
      );

      final result = await repo.getCountries();

      result.when(
        success: (data, source) {
          expect(source, DataSource.remote);
          expect(data.length, 1);
          expect(data.first.name, "Jordan");
        },
        error: (_) => fail("Should not reach error state"),
      );
    });

    //--------------------------------------------------------------------
    //! Remote Error + Cache
    //--------------------------------------------------------------------
    test("Should return ApiResult.success(local) when API fails but cache exists", () async {
      final mockDio = MockDio();

      when(mockDio.options).thenReturn(BaseOptions());
      when(mockDio.fetch<List<dynamic>>(any)).thenThrow(Exception());

      await pref.setString(
        "COUNTRIES",
        jsonEncode([
          {"name": "Egypt", "capital": "Cairo", "cca2": "EG", "cca3": "EGY"},
        ]),
      );

      final repo = HomeRepositoryImpl(
        api: RemoteHomeDataSource(mockDio),
        localDataSource: LocalCountryHomeDataSource(pref: pref),
      );

      final result = await repo.getCountries();

      result.when(
        success: (data, source) {
          expect(source, DataSource.local);
          expect(data.first.name, "Egypt");
        },
        error: (_) => fail("Should NOT return error when cache exists"),
      );
    });

    //--------------------------------------------------------------------
    //!  Remote Error + Cache
    //--------------------------------------------------------------------
    test("Should return ApiResult.error when API fails and no cache exists", () async {
      final mockDio = MockDio();

      when(mockDio.options).thenReturn(BaseOptions());
      when(mockDio.fetch<List<dynamic>>(any)).thenThrow(Exception());

      final repo = HomeRepositoryImpl(
        api: RemoteHomeDataSource(mockDio),
        localDataSource: LocalCountryHomeDataSource(pref: pref),
      );

      final result = await repo.getCountries();

      result.when(
        success: (_, _) => fail("Should not return success without cache"),
        error: (failure) {
          expect(failure, isA<Failure>());
        },
      );
    });

    //--------------------------------------------------------------------
    //! Testing getCachedCountries()
    //--------------------------------------------------------------------
    test("getCachedCountries should return null if cache empty", () async {
      final repo = HomeRepositoryImpl(
        api: RemoteHomeDataSource(MockDio()),
        localDataSource: LocalCountryHomeDataSource(pref: pref),
      );

      final result = await repo.getCachedCountries();
      expect(result, null);
    });

    test("getCachedCountries should return converted entities if cache exists", () async {
      await pref.setString(
        "COUNTRIES",
        jsonEncode([
          {"name": "Lebanon", "capital": "Beirut", "cca2": "LB", "cca3": "LBN"},
        ]),
      );

      final repo = HomeRepositoryImpl(
        api: RemoteHomeDataSource(MockDio()),
        localDataSource: LocalCountryHomeDataSource(pref: pref),
      );

      final result = await repo.getCachedCountries();

      expect(result!.first.name, "Lebanon");
    });

    //--------------------------------------------------------------------
    //! Edge Cases
    //--------------------------------------------------------------------
    test("Should save data to cache when API succeeds", () async {
      final mockDio = MockDio();

      when(mockDio.options).thenReturn(BaseOptions());
      when(mockDio.fetch<List<dynamic>>(any)).thenAnswer((_) async {
        return Response<List<dynamic>>(
          requestOptions: RequestOptions(),
          data: [
            {"name": "Jordan", "capital": "Amman", "cca2": "JO", "cca3": "JOR"},
          ],
        );
      });

      final repo = HomeRepositoryImpl(
        api: RemoteHomeDataSource(mockDio),
        localDataSource: LocalCountryHomeDataSource(pref: pref),
      );

      await repo.getCountries();

      // Verify cache was saved
      final cached = pref.getString("COUNTRIES");
      expect(cached, isNotNull);
      expect(cached, isNotEmpty);
    });

    test("Should handle empty API response", () async {
      final mockDio = MockDio();

      when(mockDio.options).thenReturn(BaseOptions());
      when(mockDio.fetch<List<dynamic>>(any)).thenAnswer((_) async {
        return Response<List<dynamic>>(requestOptions: RequestOptions(), data: []);
      });

      final repo = HomeRepositoryImpl(
        api: RemoteHomeDataSource(mockDio),
        localDataSource: LocalCountryHomeDataSource(pref: pref),
      );

      final result = await repo.getCountries();

      result.when(
        success: (data, source) {
          expect(data, isEmpty);
          expect(source, DataSource.remote);
        },
        error: (_) => fail("Should return success even with empty data"),
      );
    });

    test("Should handle malformed cache data gracefully", () async {
      await pref.setString("COUNTRIES", "invalid json");

      final repo = HomeRepositoryImpl(
        api: RemoteHomeDataSource(MockDio()),
        localDataSource: LocalCountryHomeDataSource(pref: pref),
      );

      // Should return null when cache is malformed
      final result = await repo.getCachedCountries();
      expect(result, isNull);
    });
  });
}
