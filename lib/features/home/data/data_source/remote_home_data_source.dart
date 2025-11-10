import 'package:countries/networking/constants_api.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/model.dart';

part 'remote_home_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class RemoteHomeDataSource {
  factory RemoteHomeDataSource(Dio dio) = _RemoteHomeDataSource;

  @GET(ApiConstants.allCountries)
  Future<List<HomeModel>> getHomeData();
}
