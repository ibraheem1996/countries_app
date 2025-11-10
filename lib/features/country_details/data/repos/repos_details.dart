import 'package:countries/features/country_details/data/model/details_model.dart';

import '../../../../networking/api_result.dart';
import '../../../../networking/error_handler.dart';
import '../../doman/repository.dart';
import '../data_sourse/remote_details_data_sourse.dart';

class DetailsReposImpl implements DetailsRepository {
  final RemoteDetailsDataSourse remoteDetailsDataSourse;

  DetailsReposImpl({required this. remoteDetailsDataSourse});

  @override
  Future<ApiResult<List<DetailsModel>>> getDetailsData(String cca3) async {
    try {
      final result = await remoteDetailsDataSourse.detailsCountry(cca3);
      
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.error(ErrorHandler.handle(e));
    }
  }
}
