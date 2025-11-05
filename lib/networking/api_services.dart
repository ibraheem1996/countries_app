import 'package:countries/networking/constants_api.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../features/home/data/model/modele.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ConstantsApi.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @GET('all?fields=name,flags,cca3,translations,coatOfArms')
  Future<List<HomeModele>> getHomeData();
}
