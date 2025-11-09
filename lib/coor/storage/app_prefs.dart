// lib/core/storage/app_prefs.dart
//
// Ready-to-use SharedPreferences helper.
// - Call: await AppPrefs.init();
// - Then use: AppPrefs.setJson('countries', list); AppPrefs.getJsonList('countries');
// - Includes: String/Int/Bool/Double/StringList, JSON map/list, TTL cache, exists/remove/clear, prefix-clear.

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AppPrefs {
  AppPrefs._();
  static late SharedPreferences _prefs;
  static bool _ready = false;

  /// MUST be called once (e.g., in main()) before using any other method.
  static Future<void> init() async {
    if (_ready) return;
    _prefs = await SharedPreferences.getInstance();
    _ready = true;
  }

  // -------------------- Basic types --------------------

  static Future<bool> setString(String key, String value) => _prefs.setString(key, value);
  static String? getString(String key) => _prefs.getString(key);

  static Future<bool> setInt(String key, int value) => _prefs.setInt(key, value);
  static int? getInt(String key) => _prefs.getInt(key);

  static Future<bool> setDouble(String key, double value) => _prefs.setDouble(key, value);
  static double? getDouble(String key) => _prefs.getDouble(key);

  static Future<bool> setBool(String key, bool value) => _prefs.setBool(key, value);
  static bool? getBool(String key) => _prefs.getBool(key);

  static Future<bool> setStringList(String key, List<String> value) =>
      _prefs.setStringList(key, value);
  static List<String>? getStringList(String key) => _prefs.getStringList(key);

  // -------------------- JSON helpers --------------------
  // Store ANY json-encodable object (Map/List/primitive)
  static Future<bool> setJson(String key, Object? value) {
    final str = jsonEncode(value);
    return _prefs.setString(key, str);
  }

  // Decode JSON into Map<String, dynamic>
  static Map<String, dynamic>? getJsonMap(String key) {
    final str = _prefs.getString(key);
    if (str == null) return null;
    final decoded = jsonDecode(str);
    if (decoded is Map) {
      // ensure proper typing
      return Map<String, dynamic>.from(decoded as Map);
    }
    return null;
  }

  // Decode JSON into List<Map<String, dynamic>>
  static List<Map<String, dynamic>>? getJsonList(String key) {
    final str = _prefs.getString(key);
    if (str == null) return null;
    final decoded = jsonDecode(str);
    if (decoded is List) {
      return decoded.map((e) => Map<String, dynamic>.from(e as Map)).toList();
    }
    return null;
  }

  // -------------------- TTL cache (Time-To-Live) --------------------
  // Saves value + timestamp. Expires after [ttl].
  static Future<void> setJsonWithTTL(String key, Object? value, Duration ttl) async {
    await setJson(key, value);
    await _prefs.setInt(_tsKey(key), DateTime.now().millisecondsSinceEpoch);
    await _prefs.setInt(_ttlKey(key), ttl.inMilliseconds);
  }

  // Returns JSON if not expired; otherwise null.
  static Map<String, dynamic>? getJsonMapWithTTL(String key) {
    if (!_isFresh(key)) return null;
    return getJsonMap(key);
  }

  static List<Map<String, dynamic>>? getJsonListWithTTL(String key) {
    if (!_isFresh(key)) return null;
    return getJsonList(key);
  }

  // Freshness check (private)
  static bool _isFresh(String key) {
    final savedAt = _prefs.getInt(_tsKey(key));
    final ttlMs = _prefs.getInt(_ttlKey(key));
    if (savedAt == null || ttlMs == null) return false;
    final age = DateTime.now().millisecondsSinceEpoch - savedAt;
    return age < ttlMs;
  }

  // -------------------- Utils --------------------

  static bool exists(String key) => _prefs.containsKey(key);

  static Future<bool> remove(String key) async {
    // also remove TTL metadata if present
    await _prefs.remove(_tsKey(key));
    await _prefs.remove(_ttlKey(key));
    return _prefs.remove(key);
  }

  static Future<bool> clearAll() => _prefs.clear();

  /// Remove all keys starting with [prefix]
  static Future<void> removeByPrefix(String prefix) async {
    final keys = _prefs.getKeys().where((k) => k.startsWith(prefix)).toList();
    for (final k in keys) {
      await _prefs.remove(k);
      await _prefs.remove(_tsKey(k));
      await _prefs.remove(_ttlKey(k));
    }
  }

  /// For manual timestamp access (optional)
  static DateTime? lastUpdated(String key) {
    final ts = _prefs.getInt(_tsKey(key));
    return ts == null ? null : DateTime.fromMillisecondsSinceEpoch(ts);
  }

  // -------------------- Private helpers --------------------
  static String _tsKey(String base) => '${base}__ts';
  static String _ttlKey(String base) => '${base}__ttl';
}
