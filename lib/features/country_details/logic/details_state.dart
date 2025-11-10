part of 'details_cubit.dart';

@freezed
class DetailsState with _$DetailsState {
  const factory DetailsState.initial() = _Initial;
  const factory DetailsState.loading() = Loading;
  const factory DetailsState.loaded(List < CountryDetailsEntities>? detailsModel) = Loaded;
  const factory DetailsState.error(Failure failure) = Error;
}
