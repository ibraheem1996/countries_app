import 'package:countries/networking/constants_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'Interceptor.dart';

class DioFactory {
  static final DioFactory _instance = DioFactory._internal();
  static Dio? _dio;

  factory DioFactory() => _instance;
  DioFactory._internal();

  Dio getDio() {
    if (_dio != null) return _dio!;

    final options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      // headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
    );

    _dio = Dio(options);

    if (kDebugMode) {
      // _dio!.interceptors.add(
      //   PrettyDioLogger(
      //     requestHeader: true,
      //     requestBody: true,
      //     responseBody: true,
      //     responseHeader: false,
      //     error: true,
      //     compact: true,
      //     maxWidth: 120,
      //   ),

      // );
     
    }
    _dio!.interceptors.add(AppInterceptor());

    return _dio!;
  }
}
