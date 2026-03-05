import 'dart:convert';
import 'package:flutter/services.dart';

enum Environment { development, staging, production }

class Env {
  Env._();
  static Env? _instance;
  static Env get instance {
    _instance ??= Env._();
    return _instance!;
  }
  // Variables

  static String get apiBaseUrl => _values['apiUrl'] ?? '';
  static String get apiKey => _values['apiKey'] ?? '';
  static String get appName {
    final appName = _values['appName'];
    if (appName == null) {
      print(
        "Warning: 'appName' is not defined in the environment configuration.",
      );
    }
    return _values['appName'] ?? '';
  }

  //final String apiBaseUrl;

  static Map<String, dynamic> _values = {};

  static late final Environment environment;

  static Future<void> initialize() async {
    String fileName;
    switch (environment) {
      case Environment.development:
        fileName = 'env_dev.json';
        break;
      case Environment.staging:
        fileName = 'env_staging.json';
        break;
      case Environment.production:
        fileName = 'env_prod.json';
        break;
    }
    _values = await load(fileName);
  }

  static Future<Map<String, dynamic>> load(String fileName) async {
    // Cargar el archivo JSON correspondiente al entorno
    return rootBundle.loadString(fileName).then((jsonString) {
      return json.decode(jsonString);
    });
  }
}
