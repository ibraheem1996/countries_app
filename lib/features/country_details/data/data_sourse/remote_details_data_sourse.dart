import 'package:countries/networking/constants_api.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/details_model.dart';

part 'remotede_details_data_sourse.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class RemoteDetailsDataSourse {
  factory RemoteDetailsDataSourse(Dio dio) = _RemoteDetailsDataSourse;

  @GET("${ApiConstants.detailsCountry}/{cca3}")
  Future<List<DetailsModel>> detailsCountry(@Path('cca3') String cca3);
}
