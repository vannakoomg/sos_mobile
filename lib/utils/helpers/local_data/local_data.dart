import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  //CurrentUser=============================
  static Future<String> getCurrentUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String value = (pref.getString('current_user') ?? "");
    return value;
  }

  static Future<void> storeCurrentUser(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('current_user', token);
  }

  static Future<void> removeCurrentUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove('current_user');
  }

  //Store Simple Varrible=============================

  //store type String
  static Future<void> storeString(String key, String value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(key, value);
  }

  static Future<String> getString(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String value = (pref.getString(key) ?? "");
    return value;
  }

  //store type bool
  static Future<void> storeBool(String key, bool value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(key, value);
  }

  static Future<bool> getBool(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool value = pref.getBool(key) ?? false;
    return value;
  }
}
