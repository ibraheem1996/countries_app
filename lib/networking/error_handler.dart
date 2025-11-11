import 'dart:io';
import 'package:dio/dio.dart';
import 'failure.dart';

class ErrorHandler {
  static Failure handle(dynamic error) {
    if (error is DioException) {
      final response = error.response;

      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          return const Failure.network(message: 'Connection timeout');

        case DioExceptionType.badResponse:
          final int? statusCode = response?.statusCode;
          final String message = _extractServerMessage(response?.data);
          return Failure.server(message: message, statusCode: statusCode);

        case DioExceptionType.cancel:
          return const Failure.unexpected(message: 'Request was cancelled');

        case DioExceptionType.unknown:
          if (error.error is SocketException) {
            return const Failure.network();
          }
          return const Failure.unexpected(message: 'Unknown error');

        default:
          return const Failure.unexpected(message: 'Unknown error');
      }
    } else if (error is SocketException) {
      return const Failure.network();
    } else if (error is FormatException) {
      return const Failure.unexpected(message: 'Data format error');
    } else {
      print("=========================");
      print('⚠️ Unknown Error Type: ${error.runtimeType} | Value: $error');
      return const Failure.unexpected(message: 'Unknown ');
    }

    // return const Failure.unexpected(message: 'Unknown ');
  }

  static String _extractServerMessage(dynamic data) {
    try {
      if (data is Map<String, dynamic>) {
        return data['message']?.toString() ?? 'Server error';
      } else if (data is String) {
        return data;
      }
      return 'Server error';
    } catch (_) {
      return 'Server error';
    }
  }
}
