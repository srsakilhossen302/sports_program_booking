import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefe {
  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }
}
