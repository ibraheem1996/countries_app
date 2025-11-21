// import 'dart:convert';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';

// import 'package:countries/features/home/data/data_source/remote_home_data_source.dart';
// import 'package:countries/features/home/data/data_source/local_home_data_source.dart';
// import 'package:countries/features/home/data/model/model.dart';
// import 'package:countries/networking/api_result.dart';

// class MockRemote extends Mock implements RemoteHomeDataSource {}

// class MockLocal extends Mock implements LocalCountryHomeDataSource {}

// void main() {
//   late MockRemote remote;
//   late MockLocal local;
//   late HomeRepositoryImpl repo;

//   setUp(() {
//     remote = MockRemote();
//     local = MockLocal();
//     repo = HomeRepositoryImpl(api: remote, localDataSource: local);
//   });

//   test('✅ يرجّع بيانات من الـ API ويحفظها في الكاش', () async {
//     final dto = HomeModel(nameCommon: 'Jordan'); // عدّل حسب موديلك
//     when(() => remote.getHomeData()).thenAnswer((_) async => [dto]);
//     when(() => local.save(any())).thenAnswer((_) async {});

//     final result = await repo.getCountries();

//     expect(result, isA<ApiResultSuccess>());
//     result.when(
//       success: (data) {
//         expect(data.length, 1);
//         expect(data.first.nameCommon, 'Jordan');
//       },
//       error: (_) => fail('ما لازم يدخل error هون'),
//     );
//     verify(() => local.save(any())).called(1);
//   });

//   test('✅ لو API فشل وفي كاش يرجّع بيانات من الكاش', () async {
//     when(() => remote.getHomeData()).thenThrow(Exception());
//     final cachedJson = jsonEncode([
//       {'nameCommon': 'Jordan'}, // نفس شكل الـ HomeModel.fromJson
//     ]);

//     when(() => local.getCountries()).thenReturn(cachedJson);

//     final result = await repo.getCountries();

//     result.when(
//       success: (data) {
//         expect(data.length, 1);
//       },
//       error: (_) => fail('كان لازم يرجع success من الكاش'),
//     );
//   });

//   test('❌ لو API فشل وما في كاش يرجّع error', () async {
//     when(() => remote.getHomeData()).thenThrow(Exception());
//     when(() => local.getCountries()).thenReturn(null);

//     final result = await repo.getCountries();

//     expect(result, isA<ApiResultError>());
//   });
// }
