import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async' show Future;

class DataSharedPreferences {
  static SharedPreferences _preferences;
  static Future<SharedPreferences> get _instance async =>
      _preferences ??= await SharedPreferences.getInstance();

  static const token = 'token';
  static Future<SharedPreferences> init() async =>
      _preferences = await _instance;
  static Future setToken(String token) async =>
      await _preferences.setString(token, token);
  static String getToken() => _preferences.getString(token);
}
