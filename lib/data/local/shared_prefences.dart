import 'package:shared_preferences/shared_preferences.dart';

class Spreferences {
  static SharedPreferences? _preferences;

  static const _attendanceList = 'attendanceList';
  // static const _dateFormat = 'dateFormat';
  static const _dateTimeAgo = 'dateTimeAgo';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setIsDateTimeAgo(bool timeAgo) async =>
      await _preferences!.setBool(_dateTimeAgo, timeAgo);

  static bool? getIsDateTimeAgo() => _preferences!.getBool(_dateTimeAgo);

  // static Future setDateFormat(String format) async =>
  //     await _preferences!.setString(_dateFormat, format);

  // static String? getDateFormat() => _preferences!.getString(_dateFormat);

  static Future setAttendanceList(String attendaceList) async =>
      await _preferences!.setString(_attendanceList, attendaceList);

  static String? getAttendanceList() =>
      _preferences!.getString(_attendanceList);
}
