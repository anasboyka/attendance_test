import 'dart:convert';

import 'package:attendance_test/data/local/shared_prefences.dart';
import 'package:attendance_test/data/models/attendance.dart';

class AttendanceRepo {
  List<Map<String, dynamic>> dataset = [
    {
      "user": "Chan Saw Lin",
      "phone": "0152131113",
      "check-in": DateTime(2020, 06, 30, 16, 10, 05),
    },
    {
      "user": "Lee Saw Loy",
      "phone": "0161231346",
      "check-in": DateTime(2020, 07, 11, 15, 39, 59),
    },
    {
      "user": "Khaw Tong Lin",
      "phone": "0158398109",
      "check-in": DateTime(2020, 08, 19, 11, 10, 18),
    },
    {
      "user": "Lim Kok Lin",
      "phone": "0168279101",
      "check-in": DateTime(2020, 08, 19, 11, 11, 35),
    },
    {
      "user": "Low Jun Wei",
      "phone": "0112731912",
      "check-in": DateTime(2020, 08, 15, 13, 00, 05),
    },
    {
      "user": "Yong Weng Kai",
      "phone": "0172332743",
      "check-in": DateTime(2020, 07, 31, 18, 10, 11),
    },
    {
      "user": "Jayden Lee",
      "phone": "0191236439",
      "check-in": DateTime(2020, 08, 22, 08, 10, 38),
    },
    {
      "user": "Kong Kah Yan",
      "phone": "0111931233",
      "check-in": DateTime(2020, 07, 11, 12, 00, 00),
    },
    {
      "user": "Jasmine Lau",
      "phone": "0162879190",
      "check-in": DateTime(2020, 08, 01, 12, 10, 05),
    },
    {
      "user": "Chan Saw Lin",
      "phone": "016783239",
      "check-in": DateTime(2020, 08, 23, 11, 59, 05),
    },
  ];

  Future<List<Attendance>> getAttendanceListPreferences() async {
    String? attendanceListPref = Spreferences.getAttendanceList();
    if (attendanceListPref != null) {
      // print('if');
      // print(json.decode(attendanceListPref));
      return (json.decode(attendanceListPref) as List)
          .map((e) => Attendance.fromMap(e))
          .toList();
    } else {
      // print('else');
      List<Attendance> attendanceList =
          dataset.map((e) => Attendance.fromMap(e)).toList();
      // print(attendanceList);
      attendanceList.sort(
        (a, b) => b.checkIn.compareTo(a.checkIn),
      );
      print(attendanceList);
      String attendanceListPref = json.encode(attendanceList);

      await Spreferences.setAttendanceList(attendanceListPref);
      return attendanceList;
    }
  }

  Future<void> setAttendanceListPreferences(
      List<Attendance> attendanceList) async {
    String attendanceListPref = json.encode(attendanceList);
    await Spreferences.setAttendanceList(attendanceListPref);
    //print(Spreferences.getAttendanceList());
  }

  Future<void> setDateFormat(bool isDate) async {
    await Spreferences.setIsDateTimeAgo(isDate);
  }

  Future getDateFormat() async {
    bool? isDate = Spreferences.getIsDateTimeAgo();
    if (isDate == null) {
      await Spreferences.setIsDateTimeAgo(false);
      return false;
    } else {
      return isDate;
    }
  }
}
