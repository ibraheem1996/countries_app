
import 'package:countries/networking/api_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../networking/failure.dart';
import '../data/model/details_model.dart';
import '../doman/entities.dart';
import '../doman/repository.dart';

part 'details_state.dart';
part 'details_cubit.freezed.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final DetailsRepository detailsRepos ;
  DetailsCubit({required this.detailsRepos}) : super(DetailsState.initial());

  Future<void> getDetails(String cca3) async {
    emit(DetailsState.loading());
    final result = await detailsRepos.getDetailsData(cca3);
    result.when(
      success: (data) => emit(DetailsState.loaded(data)),
      error: (error) => emit(DetailsState.error(error)),
    );
  }
  
}
