import 'dart:convert';

import 'package:countries/networking/api_result.dart';
import 'package:countries/networking/error_handler.dart';

import '../../domain/entities/entities.dart';
import '../../domain/repository/repository.dart';
import '../../logic/home_cubit.dart';
import '../data_source/local_home_data_source.dart';
import '../data_source/remote_home_data_source.dart';
import '../model/model.dart';
import '../model/mappers.dart';

class HomeRepositoryImpl implements HomeRepository {
  final RemoteHomeDataSource api;
  final LocalCountryHomeDataSource localDataSource;

  HomeRepositoryImpl({required this.api, required this.localDataSource});
  @override
  Future<ApiResult<List<Country>>> getCountries() async {
    try {
      final List<HomeModel> dtos = await api.getHomeData();
      final data = dtos.map((e) => e.toJson()).toList();
      await localDataSource.save(jsonEncode(data));
      final entities = dtos.map((e) => e.toEntity()).toList();
      return ApiResult.success(entities, source: DataSource.remote);
    } catch (e) {
      final cached = localDataSource.getCountries();
      if (cached != null && cached.isNotEmpty) {
        final List decoded = jsonDecode(cached);
        final cachedModels = decoded.map<HomeModel>((e) => HomeModel.fromJson(e)).toList();
        final cachedEntities = cachedModels.map((e) => e.toEntity()).toList();
        return ApiResult.success(cachedEntities, source: DataSource.local);
      }
      return ApiResult.error(ErrorHandler.handle(e));
    }
  }

  @override
  Future<List<Country>?> getCachedCountries() async {
    final cached = localDataSource.getCountries();
    if (cached == null) {
      return Future.value(null);
    }
    final List<HomeModel> decode = (jsonDecode(cached) as List)
        .map<HomeModel>((e) => HomeModel.fromJson(e))
        .toList();
    return decode.map((e) => e.toEntity()).toList();
  }
}
