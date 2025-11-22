import 'dart:convert';

import 'package:countries/features/country_details/data/data_sourse/local_details_data_sourse.dart';
import 'package:countries/features/country_details/data/model/details_mapper.dart';
import 'package:countries/features/country_details/data/model/details_model.dart';

import '../../../../networking/api_result.dart';
import '../../../../networking/error_handler.dart';
import '../../doman/entities.dart';
import '../../doman/repository.dart';
import '../data_sourse/remote_details_data_sourse.dart';

class DetailsReposImpl implements DetailsRepository {
  final RemoteDetailsDataSourse remoteDetailsDataSourse;
  final LocalDetailsDataSource localDetailsDataSourse;

  DetailsReposImpl({required this. remoteDetailsDataSourse , required this.localDetailsDataSourse});

  @override
  Future<ApiResult<List<CountryDetailsEntities>>> getDetailsData(String cca3) async {
    final cached = localDetailsDataSourse.getDetails(theKey: cca3);
    try {
      final result = await remoteDetailsDataSourse.detailsCountry(cca3);
      final json = result.map((e) => e.toJson()).toList();
      await localDetailsDataSourse.save(detailsModel: jsonEncode(json), theKey: cca3);
      final entities = result.map((e)=> e.toEntity()).toList();
      return ApiResult.success(entities);
    } catch (e) {
        if ( cached != null && cached.isNotEmpty) {
          final List decoded = jsonDecode(cached);
          final cachedModels = decoded.map<DetailsModel>((e) => DetailsModel.fromJson(e)).toList();
      final entities = cachedModels.map((e) => e.toEntity()).toList();

          return ApiResult.success(entities);
        }
      return ApiResult.error(ErrorHandler.handle(e));
    }
  }
}
