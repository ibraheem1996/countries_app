import '../../../../networking/api_result.dart';
import '../../../../networking/api_services.dart';
import '../../../../networking/error_handler.dart';
import '../model/modele.dart';

class HomeRepos {
  final ApiServices _apiServices;

  HomeRepos({ required ApiServices apiServices }) : _apiServices = apiServices ;
Future <ApiResult<List<HomeModel>>> getHomeData()async{
    try{
       final result =await _apiServices.getHomeData();
       return ApiResult.success( result);
    }catch(e){
      return ApiResult.error( ErrorHandler.handle(e)); 
    }
  }
}