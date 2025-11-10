import '../../../networking/api_result.dart';
import '../data/model/details_model.dart';

abstract class DetailsRepository {
  Future<ApiResult<DetailsModel>> detailsCountry(String cca3);
}