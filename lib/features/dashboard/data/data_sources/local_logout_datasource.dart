import 'package:session_3/core/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalLogoutDatasource {
  final SharedPreferences _prefs;

  LocalLogoutDatasource({SharedPreferences? prefs})
    : _prefs = prefs ?? LocalStorage().prefs;

  Future<void> clearSession() async {
    await _prefs.clear();
  }
}
