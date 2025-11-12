import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
abstract class Failure with _$Failure {
  const factory Failure.server({
    required String message,
    @Default(Icon(Icons.cloud_off_rounded, color: Colors.orangeAccent)) Icon? icon,
  }) = ServerFailure;

  const factory Failure.network({
    @Default('No internet connection. Please check your network settings.') String message,
    @Default(Icon(Icons.wifi_off_rounded, color: Colors.blueAccent)) Icon? icon,
  }) = NetworkFailure;

  const factory Failure.unexpected({
    @Default('Something went wrong. Please try again.') String message,
    @Default(Icon(Icons.error_outline, color: Colors.redAccent)) Icon? icon,
  }) = UnexpectedFailure;

  const factory Failure.data({
    @Default('There was an error reading data. Please try again later.') String message,
    @Default(Icon(Icons.dataset_linked_rounded, color: Colors.deepPurple)) Icon? icon,
  }) = DataFailure;

  const factory Failure.empty({
    @Default('No data available right now.') String message,
    @Default(Icon(Icons.inbox_rounded, color: Colors.grey)) Icon? icon,
  }) = EmptyFailure;

  const factory Failure.local({
    @Default('A local storage error occurred.') String message,
    @Default(Icon(Icons.save_alt_rounded, color: Colors.teal)) Icon? icon,
  }) = LocalFailure;

  
}
