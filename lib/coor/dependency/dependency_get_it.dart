// lib/coor/dependency/dependency_get_it.dart
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import '../../features/home/data/repos/home_repos_impl.dart';
import '../../features/home/domain/repository.dart';
import '../../features/home/domain/use_cases.dart';
import '../../networking/dio_factory.dart';
import '../../networking/api_services.dart';

import '../../features/home/logic/home_cubit.dart';

import '../../features/country_details/data/repos/repos_details.dart';
import '../../features/country_details/logic/details_cubit.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  //! Dio
  getIt.registerLazySingleton<Dio>(() => DioFactory().getDio());

  //!ApiServices
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(getIt<Dio>()));

  //! Home Repository (Impl)
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(api: getIt<ApiServices>()));

  //! UseCases
  getIt.registerFactory<GetCountriesUseCase>(
    () => GetCountriesUseCase(homeRepos: getIt<HomeRepository>()),
  );

  //! Cubit
  getIt.registerFactory<HomeCubit>(() => HomeCubit(countriesUseCase: getIt<GetCountriesUseCase>()));

  //! Details
  getIt.registerLazySingleton<DetailsRepos>(() => DetailsRepos(apiServices: getIt<ApiServices>()));
  getIt.registerFactory<DetailsCubit>(() => DetailsCubit(detailsRepos: getIt<DetailsRepos>()));
}
