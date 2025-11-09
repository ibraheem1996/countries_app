import 'package:countries/networking/api_result.dart';
import 'package:countries/networking/api_services.dart';
import 'package:countries/networking/error_handler.dart';

import '../../domain/entities.dart';
import '../../domain/repository.dart';
import '../model/model.dart';
import '../model/mappers.dart';

class HomeRepositoryImpl implements HomeRepository {
  final ApiServices _api;
  HomeRepositoryImpl({required ApiServices api}) : _api = api;

  @override
  Future<ApiResult<List<Country>>> getCountries() async {
    try {
      final List<HomeModel> dtos = await _api.getHomeData();
      final entities = dtos.map((e) => e.toEntity()).toList();
      return ApiResult.success(entities);
    } catch (e) {
      return ApiResult.error(ErrorHandler.handle(e));
    }
  }
}
