// lib/coor/dependency/dependency_get_it.dart
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/home/data/data_source/local_home_data_source.dart';
import '../../features/home/data/data_source/remote_home_data_source.dart';
import '../../features/home/data/repos/home_repos_impl.dart';
import '../../features/home/domain/repository.dart';
import '../../features/home/domain/use_cases.dart';
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

  //! Cubit
  getIt.registerFactory<HomeCubit>(() => HomeCubit(countriesUseCase: getIt<GetCountriesUseCase>()));

  //! UseCases
  getIt.registerFactory<GetCountriesUseCase>(
    () => GetCountriesUseCase(homeRepos: getIt<HomeRepository>()),
  );

  //! Home Repository (Impl)
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      api: getIt<RemoteHomeDataSource>(),
      localDataSource: getIt<CountryLocalDataSource>(),
    ),
  );

  //!HOME REMOTE DATA SOURCE
  getIt.registerLazySingleton<RemoteHomeDataSource>(() => RemoteHomeDataSource(getIt<Dio>()));

  //!HOME LOCAL DATA SOURCE
  getIt.registerLazySingleton<CountryLocalDataSource>(
    () => CountryLocalDataSource(pref: getIt<SharedPreferences>()),
  );

  //! Details
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(getIt<Dio>()));
  getIt.registerLazySingleton<DetailsRepos>(() => DetailsRepos(apiServices: getIt<ApiServices>()));
  getIt.registerFactory<DetailsCubit>(() => DetailsCubit(detailsRepos: getIt<DetailsRepos>()));
}
