import 'package:countries/networking/api_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../networking/failure.dart';
import '../doman/entities.dart';
import '../doman/use_cases.dart';

part 'details_state.dart';
part 'details_cubit.freezed.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final GetDetailsCountryUseCase detailsUseCase;
  DetailsCubit({required this.detailsUseCase}) : super(const DetailsState.initial());

  Future<void> getDetails(String cca3) async {
    emit(const DetailsState.loading());
    final result = await detailsUseCase(cca3);
    result.when(
      success: (data) {
        if (!isClosed) {
          emit(DetailsState.loaded(data));
        }
      },
      error: (error) {
        if (!isClosed) {
          emit(DetailsState.error(error));
        }
      },
    );
  }
}
