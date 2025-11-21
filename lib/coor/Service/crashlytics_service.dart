import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class CrashlyticsService {
  static final CrashlyticsService _instance = CrashlyticsService._();
  factory CrashlyticsService() => _instance;

  final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;

  CrashlyticsService._();

  void logError(dynamic error, StackTrace? stack, {String reason = "Unknown"}) {
    _crashlytics.recordError(error, stack, reason: reason);
  }

  void setUserId(String id) {
    _crashlytics.setUserIdentifier(id);
  }

  void setKey(String key, String value) {
    _crashlytics.setCustomKey(key, value);
  }
}
