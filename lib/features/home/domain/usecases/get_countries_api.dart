import 'package:countries/networking/api_result.dart';
import '../../../../coor/use_case/use_cases.dart';
import '../entities/entities.dart';
import '../repository/repository.dart';

class GetCountriesRemoteHomeUseCase implements UseCase<List<Country>, NoParams> {
  final HomeRepository homeRepos;
  GetCountriesRemoteHomeUseCase({required this.homeRepos});

  @override
  Future<ApiResult<List<Country>>> call(NoParams params) {
    return homeRepos.getCountries();
  }


}
