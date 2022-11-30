import 'dart:collection';
import 'dart:convert';

import 'package:attendance_test/data/data_repo/attendance_repository.dart';
import 'package:attendance_test/data/local/shared_prefences.dart';
import 'package:attendance_test/data/models/attendance.dart';
import 'package:flutter/material.dart';

class AttendanceProvider extends ChangeNotifier {
  List<Attendance> attendanceList;
  bool isDate;

  AttendanceProvider({this.attendanceList = const [], this.isDate = true});

  String _query = "";

  UnmodifiableListView<Attendance> get attendances => _query.isEmpty
      ? UnmodifiableListView(attendanceList)
      : UnmodifiableListView(suggestions(attendanceList, _query));

  void addAttendance(Attendance attendance) async {
    attendanceList.add(attendance);
    attendanceList.sort(
      (a, b) => b.checkIn.compareTo(a.checkIn),
    );
    await AttendanceRepo().setAttendanceListPreferences(attendanceList);
    notifyListeners();
  }

  List<Attendance> suggestions(List<Attendance> attendances, String query) {
    List<Attendance> suggestions = [];
    for (var i = 0; i < attendances.length; i++) {
      if (attendances[i].user.toLowerCase().contains(query.toLowerCase())) {
        suggestions.add(attendances[i]);
      }
    }
    return suggestions;
  }

  void initializeData() async {
    attendanceList = await AttendanceRepo().getAttendanceListPreferences();
    isDate = await AttendanceRepo().getDateFormat();
    notifyListeners();
  }

  void searchAttendance(String query) {
    _query = query;
    // print(_query.isEmpty);
    notifyListeners();
  }

  void setDateFormat(bool isDateFormat) async {
    isDate = isDateFormat;
    await AttendanceRepo().setDateFormat(isDate);
    notifyListeners();
  }
}
