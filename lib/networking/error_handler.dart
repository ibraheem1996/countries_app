import 'dart:io';
import 'package:dio/dio.dart';
import 'failure.dart';

class ErrorHandler {
  static Failure handle(dynamic error) {
    try {
      if (error is DioException) {
        final response = error.response;

        switch (error.type) {
          case DioExceptionType.connectionTimeout:
          case DioExceptionType.receiveTimeout:
          case DioExceptionType.sendTimeout:
            return const Failure.network(
              message: 'The connection took too long. Please try again later.',
            );

          case DioExceptionType.badResponse:
            final code = response?.statusCode ?? 0;
            final message = _mapServerError(code);
            return Failure.server(message: message);

          case DioExceptionType.cancel:
            return const Failure.unexpected(message: 'The request was cancelled.');

          case DioExceptionType.unknown:
            if (error.error is SocketException) {
              return const Failure.network(
                message: 'No internet connection. Please check your network.',
              );
            }
            return const Failure.unexpected(message: 'An unknown network error occurred.');

          default:
            return const Failure.unexpected();
        }
      }
      else if (error is SocketException) {
        return const Failure.network(
          message: 'No internet connection. Please reconnect and try again.',
        );
      }
      else if (error is FormatException) {
        return const Failure.data(message: 'Invalid data format received from the server.');
      }
      // 🔹 Index or key access errors (Lists / Maps)
      else if (error is RangeError) {
        return const Failure.data(message: 'Tried to access an item that doesn’t exist.');
      } else if (error is StateError && error.message.contains('map')) {
        return const Failure.data(
          message: 'There was a problem reading data structure from the server.',
        );
      } else if (error is NoSuchMethodError || error is TypeError) {
        return const Failure.data(message: 'Data type mismatch. Please try again later.');
      }
      else if (error == null) {
        return const Failure.empty(message: 'No data found.');
      }

      return Failure.unexpected(message: 'An unexpected issue occurred. Please try again.');
    } catch (_) {
      return const Failure.unexpected(message: 'A critical internal error occurred.');
    }
  }

  static String _mapServerError(int code) {
    switch (code) {
      case 400:
        return 'There was a problem with your request. Please check and try again.';
      case 401:
        return 'You’re not authorized. Please log in again.';
      case 403:
        return 'Access denied. You do not have permission.';
      case 404:
        return 'The requested item could not be found.';
      case 429:
        return 'Too many requests. Please slow down a bit.';
      case 500:
        return 'The server encountered a problem. Please try later.';
      case 503:
        return 'The server is temporarily unavailable. Try again soon.';
      default:
        return 'A server error occurred. Please try again.';
    }
  }
}
