import 'package:shared_preferences/shared_preferences.dart';

class LocalDetailsDataSource {
  final SharedPreferences pref;

  LocalDetailsDataSource({required this.pref});
  Future<void> save({required String detailsModel,required String theKey} ) async {
    final key = theKey; 
    await pref.setString(key, detailsModel);
  }

  String? getDetails({required String theKey}) {
    final key = theKey; 
    final data = pref.getString(key);
    return data;
  }
}