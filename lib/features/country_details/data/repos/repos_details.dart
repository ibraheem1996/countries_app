import 'package:countries/features/country_details/data/model/details_model.dart';

import '../../../../networking/api_result.dart';
import '../../../../networking/api_services.dart';
import '../../../../networking/error_handler.dart';

class DetailsRepos {
  final ApiServices _apiServices;

  DetailsRepos({required ApiServices apiServices}) : _apiServices = apiServices;
  Future<ApiResult<List<DetailsModel>>> getDetailsData(String cca3) async {
    try {
      final result = await _apiServices.detailsCountry(cca3);
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.error(ErrorHandler.handle(e));
    }
  }
}
