import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefe {
  static SharedPreferences? _preferences;

  static const String _roleKey = 'role';

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> setRole(String role) async {
    await _preferences?.setString(_roleKey, role);
  }

  static String getRole() {
    return _preferences?.getString(_roleKey) ?? '';
  }
}
