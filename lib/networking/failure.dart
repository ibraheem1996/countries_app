import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
abstract class Failure with _$Failure {
  const factory Failure.server({required String message, int? statusCode}) = ServerFailure;

  const factory Failure.unexpected({@Default('Unexpected error occurred') String message}) =
      UnexpectedFailure;

  const factory Failure.network({
    @Default('Please check your internet connection') String message,
  }) = NetworkFailure;

  const factory Failure.validation({required String message}) = ValidationFailure;

  const factory Failure.local({required String message}) = LocalFailure;
}
