import 'package:countries/networking/api_result.dart';

import '../../../coor/use_case/use_cases.dart';
import 'entities.dart';
import 'repository.dart';

class GetDetailsCountryUseCase implements UseCase<List<CountryDetailsEntities>, String> {
  final DetailsRepository detailsRepos;

  GetDetailsCountryUseCase({required this.detailsRepos});
  
  @override
  Future<ApiResult<List<CountryDetailsEntities>>> call(String params) {
    return detailsRepos.getDetailsData(params);
  }
  


}