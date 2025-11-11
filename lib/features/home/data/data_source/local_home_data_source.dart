import 'package:shared_preferences/shared_preferences.dart';

class LocalCountryHomeDataSource {
  final SharedPreferences pref;

  LocalCountryHomeDataSource({required this.pref});
  static const _key = 'COUNTRIES';

  Future<void> save(String homeModel) async {
    await pref.setString(_key, homeModel);
  }

  String? getCountries() {
    final data = pref.getString(_key);
    return data;
  }
}
