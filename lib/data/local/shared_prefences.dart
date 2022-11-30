import 'package:shared_preferences/shared_preferences.dart';

class Spreferences {
  static SharedPreferences? _preferences;

  static const _attendanceList = 'attendanceList';
  static const _startup = 'startup';
  static const _dateTimeAgo = 'dateTimeAgo';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setIsDateTimeAgo(bool timeAgo) async =>
      await _preferences!.setBool(_dateTimeAgo, timeAgo);

  static bool? getIsDateTimeAgo() => _preferences!.getBool(_dateTimeAgo);

  static Future setStartup(bool startup) async =>
      await _preferences!.setBool(_startup, startup);

  static bool? getStartup() => _preferences!.getBool(_startup);

  static Future setAttendanceList(String attendaceList) async =>
      await _preferences!.setString(_attendanceList, attendaceList);

  static String? getAttendanceList() =>
      _preferences!.getString(_attendanceList);
}
