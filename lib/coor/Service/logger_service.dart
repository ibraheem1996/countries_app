import 'package:logger/logger.dart';

class LoggerService {
  LoggerService._();
  factory LoggerService() => _instance;
  static final LoggerService _instance = LoggerService._();
  final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 100,
      colors: true,
      printEmojis: true,
    ),
  );



  void info(String message) => _logger.i(message);
  void warning(String message) => _logger.w(message);
  void debug(String message) => _logger.d(message);
  void error(String message, [dynamic error, StackTrace? st]) =>
      _logger.e(message, error: error, stackTrace: st);
}

LoggerService logger = LoggerService();