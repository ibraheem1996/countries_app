part of 'home_cubit.dart';

enum DataSource { local, remote }

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = Loading;
  const factory HomeState.loaded(
    List<Country> modeles, {
    @Default(DataSource.remote) DataSource source,
  }) = Loaded;
  const factory HomeState.error(Failure failure) = Error;
}
