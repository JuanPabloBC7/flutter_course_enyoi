import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  late final SharedPreferences prefs;
  static final LocalStorage _instance = LocalStorage._internal();

  LocalStorage._internal();

  factory LocalStorage() {
    return _instance;
  }

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }
}
