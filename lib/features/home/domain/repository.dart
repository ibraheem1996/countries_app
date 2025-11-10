import 'package:countries/networking/api_result.dart';
import 'entities.dart';

abstract class HomeRepository {
  Future<ApiResult<List<Country>>> getCountries();
  Future<List<Country>?> getCachedCountries();
}
