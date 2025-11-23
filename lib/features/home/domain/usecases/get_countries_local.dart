
import '../entities/entities.dart';
import '../repository/repository.dart';

class GetCountriesLocalHomeUseCase {
  final HomeRepository homeRepos;
  GetCountriesLocalHomeUseCase({required this.homeRepos});


  Future<List<Country>?> call() {
    return homeRepos.getCachedCountries();
  }
}
