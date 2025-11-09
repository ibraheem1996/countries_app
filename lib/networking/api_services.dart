import 'package:countries/networking/constants_api.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../features/country_details/data/model/details_model.dart';
import '../features/home/data/model/model.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @GET(ApiConstants.allCountries)
  Future<List<HomeModel>> getHomeData();

  @GET("${ApiConstants.detailsCountry}/{cca3}")
  Future<List<DetailsModel>> detailsCountry(@Path('cca3') String cca3);
}
