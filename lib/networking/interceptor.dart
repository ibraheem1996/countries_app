import 'package:dio/dio.dart';
import 'package:firebase_performance/firebase_performance.dart';

import '../coor/Service/analytics_service.dart';
import '../coor/Service/crashlytics_service.dart';
import '../coor/Service/logger_service.dart';
import '../coor/Service/performance_service.dart';

class AppInterceptor extends Interceptor {
  final _log = LoggerService();
  final _analytics = AnalyticsService();
  final _crash = CrashlyticsService();
  final _perf = PerformanceService();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final metric = _perf.createHttpMetric(
      options.uri.toString(),
      _methodFromString(options.method),
    );

    options.extra['metric'] = metric;
    await metric.start();

    _log.info("➡️ API Request: ${options.method} ${options.uri}");
    _analytics.logApiRequest(options.method, options.uri.toString());

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    final metric = response.requestOptions.extra['metric'] as HttpMetric?;
    if (metric != null) {
      metric.httpResponseCode = response.statusCode;
      await metric.stop();
    }

    _log.info("⬅️ Response [${response.statusCode}] → ${response.requestOptions.uri}");
    _analytics.logApiResponse(response.requestOptions.uri.toString(), response.statusCode!);

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final metric = err.requestOptions.extra['metric'] as HttpMetric?;
    if (metric != null) {
      metric.httpResponseCode = err.response?.statusCode;
      await metric.stop();
    }

    _log.error("❌ API Error → ${err.requestOptions.uri}", err, err.stackTrace);

    _crash.logError(err, err.stackTrace, reason: "API Error: ${err.requestOptions.uri}");

    _analytics.logApiError(err.requestOptions.uri.toString(), err.message ?? "unknown");

    super.onError(err, handler);
  }

  HttpMethod _methodFromString(String method) {
    switch (method.toUpperCase()) {
      case 'POST':
        return HttpMethod.Post;
      case 'PUT':
        return HttpMethod.Put;
      case 'DELETE':
        return HttpMethod.Delete;
      default:
        return HttpMethod.Get;
    }
  }
}
