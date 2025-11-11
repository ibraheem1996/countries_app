import '../../../networking/api_result.dart';
import 'entities.dart';

abstract class DetailsRepository {
   Future<ApiResult<List<CountryDetailsEntities>>> getDetailsData(String cca3);
}