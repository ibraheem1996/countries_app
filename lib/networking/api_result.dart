import 'package:countries/networking/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../features/home/logic/home_cubit.dart';

part 'api_result.freezed.dart';

@freezed
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data, { @Default(DataSource.remote) DataSource source}) = Success<T>;
  const factory ApiResult.error(Failure failure) = Error<T>;
}
