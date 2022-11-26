import 'package:shared_preferences/shared_preferences.dart';

class Spreferences {
  static SharedPreferences? _preferences;

  static const _dateFormat = 'dateFormat';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setDateFormat(String format) async =>
      await _preferences!.setString(_dateFormat, format);

  static String? getDateFormat() => _preferences!.getString(_dateFormat);
}
