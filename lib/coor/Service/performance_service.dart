import 'package:firebase_performance/firebase_performance.dart';

class PerformanceService {
  static final PerformanceService _instance = PerformanceService._();
  factory PerformanceService() => _instance;

  PerformanceService._();

  HttpMetric createHttpMetric(String url, HttpMethod method) {
    return FirebasePerformance.instance.newHttpMetric(url, method);
  }

  Trace createTrace(String name) {
    return FirebasePerformance.instance.newTrace(name);
  }
}
