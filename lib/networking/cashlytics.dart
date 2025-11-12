import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class AppLogger {
  static Future<void> logError(dynamic error, StackTrace? stack) async {
    await FirebaseCrashlytics.instance.recordError(
      error,
      stack ?? StackTrace.current,
      fatal: false,
    );
  }
}
