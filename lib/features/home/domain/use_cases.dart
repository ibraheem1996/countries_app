import 'package:countries/networking/api_result.dart';
import '../../../coor/use_case/use_cases.dart';
import 'entities.dart';
import 'repository.dart';

class GetCountriesUseCase implements UseCase<List<Country>, NoParams> {
  final HomeRepository homeRepos;
  GetCountriesUseCase({required this.homeRepos});

  @override
  Future<ApiResult<List<Country>>> call(NoParams params) {
    return homeRepos.getCountries();
  }
}
