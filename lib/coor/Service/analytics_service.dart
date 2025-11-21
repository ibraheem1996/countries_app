import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  factory AnalyticsService() => _instance;
  static final AnalyticsService _instance = AnalyticsService._();

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  AnalyticsService._();

  Future<void> logApiRequest(String method, String url) =>
      _analytics.logEvent(name: "api_request", parameters: {"method": method, "url": url});

  Future<void> logApiResponse(String url, int status) =>
      _analytics.logEvent(name: "api_response", parameters: {"url": url, "status": status});

  Future<void> logApiError(String url, String message) =>
      _analytics.logEvent(name: "api_error", parameters: {"url": url, "message": message});

  Future<void> logScreen(String screenName) => _analytics.logScreenView(screenName: screenName);

  Future<void> logUserAction(String action) =>
      _analytics.logEvent(name: "user_action", parameters: {"action": action});
}
