import 'package:countries/features/country_details/logic/details_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import '../../features/country_details/data/repos/repos_details.dart';
import '../../networking/api_services.dart';
import '../../networking/dio_factory.dart';
import '../../features/home/data/repos/home_repos.dart';
import '../../features/home/logic/home_cubit.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  //! Dio
  getIt.registerLazySingleton<Dio>(() => DioFactory().getDio());
  //! ApiServices
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(getIt<Dio>()));
  //! HomeRepos
  getIt.registerLazySingleton<HomeRepos>(() => HomeRepos(apiServices: getIt<ApiServices>()));
  //! HomeCubit
  getIt.registerFactory<HomeCubit>(() => HomeCubit(homeRepos: getIt<HomeRepos>()));

  getIt.registerLazySingleton<DetailsRepos>(() => DetailsRepos(apiServices: getIt<ApiServices>()));
getIt.registerFactory<DetailsCubit>(() => DetailsCubit(detailsRepos: getIt<DetailsRepos>()));
}