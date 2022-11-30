import 'dart:io';

import 'package:attendance_test/data/models/attendance.dart';
import 'package:attendance_test/presentations/pages/homepage/home.dart';
import 'package:attendance_test/presentations/pages/homepage/user_detail/user_detail.dart';
import 'package:attendance_test/presentations/pages/wrapper_startup.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return Platform.isAndroid
            ? MaterialPageRoute(builder: (_) => const WrapperStartup())
            : CupertinoPageRoute(builder: (_) => const WrapperStartup());
      case '/userDetail':
        return Platform.isAndroid
            ? MaterialPageRoute(
                builder: (_) => UserDetail(attendance: args as Attendance))
            : CupertinoPageRoute(
                builder: (_) => UserDetail(attendance: args as Attendance));
      default:
        return Platform.isAndroid
            ? MaterialPageRoute(builder: (_) => const Home())
            : CupertinoPageRoute(builder: (_) => const Home());
    }
  }
}
