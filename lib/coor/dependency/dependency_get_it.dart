// lib/coor/dependency/dependency_get_it.dart
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/country_details/data/data_sourse/local_details_data_sourse.dart';
import '../../features/country_details/data/data_sourse/remote_details_data_sourse.dart';
import '../../features/country_details/doman/repository.dart';
import '../../features/country_details/doman/use_cases.dart';
import '../../features/home/data/data_source/local_home_data_source.dart';
import '../../features/home/data/data_source/remote_home_data_source.dart';
import '../../features/home/data/repos/home_repos_impl.dart';
import '../../features/home/domain/repository/repository.dart';
import '../../features/home/domain/usecases/get_countries_api.dart';
import '../../features/home/domain/usecases/get_countries_local.dart';
import '../../networking/dio_factory.dart';

import '../../features/home/logic/home_cubit.dart';

import '../../features/country_details/data/repos/repos_details.dart';
import '../../features/country_details/logic/details_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  //! Dio
  getIt.registerLazySingleton<Dio>(() => DioFactory().getDio());
  //! SharedPreferences
  final SharedPreferences pref = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(pref);
  
//!logger
  getIt.registerLazySingleton<Logger>(() => Logger());
 
  //!================Home===============================

  //!HOME LOCAL DATA SOURCE
  getIt.registerLazySingleton<LocalCountryHomeDataSource>(
    () => LocalCountryHomeDataSource(pref: getIt<SharedPreferences>()),
  );

  //!HOME REMOTE DATA SOURCE
  getIt.registerLazySingleton<RemoteHomeDataSource>(() => RemoteHomeDataSource(getIt<Dio>()));


  //! HOME Repository (Impl)
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      api: getIt<RemoteHomeDataSource>(),
      localDataSource: getIt<LocalCountryHomeDataSource>(),
    ),
  );

    //!HOME UseCases
  getIt.registerLazySingleton<GetCountriesRemoteHomeUseCase>(
    () => GetCountriesRemoteHomeUseCase(homeRepos: getIt<HomeRepository>()),
  );
  getIt.registerLazySingleton<GetCountriesLocalHomeUseCase>(
    () => GetCountriesLocalHomeUseCase(homeRepos: getIt<HomeRepository>()),
  );


  //!HOME Cubit
  getIt.registerFactory<HomeCubit>(() => HomeCubit(
      getcountriesRemoteUseCase: getIt<GetCountriesRemoteHomeUseCase>(), getCountriesLocalHomeUseCase: getIt<GetCountriesLocalHomeUseCase>()));


  //!================ Details===============================

  //! Details LOCAL DATA SOURCE
  getIt.registerLazySingleton<LocalDetailsDataSource>(
    () => LocalDetailsDataSource(pref: getIt<SharedPreferences>()),
  );

//! Details REMOTE DATA SOURCE
  getIt.registerLazySingleton<RemoteDetailsDataSourse>(() => RemoteDetailsDataSourse(getIt<Dio>()));

//! Details Repository
  getIt.registerLazySingleton<DetailsRepository>(() => DetailsReposImpl(localDetailsDataSourse: getIt<LocalDetailsDataSource>(), remoteDetailsDataSourse: getIt<RemoteDetailsDataSourse>()));

//!Details UseCases
  getIt.registerFactory<GetDetailsCountryUseCase>(() => GetDetailsCountryUseCase(detailsRepos: getIt<DetailsRepository>()));

//!Details Cubit
  getIt.registerFactory<DetailsCubit>(() => DetailsCubit(detailsUseCase: getIt<GetDetailsCountryUseCase>()));
}
