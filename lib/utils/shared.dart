import 'package:shared_preferences/shared_preferences.dart';
class Shared {
  static setString(key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }
}