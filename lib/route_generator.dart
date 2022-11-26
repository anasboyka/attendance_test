import 'package:attendance_test/presentations/pages/homepage/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(
            builder: (_) => MyHomePage(title: 'demo page'));
      default:
        return CupertinoPageRoute(
            builder: (_) => MyHomePage(title: 'demo page'));
    }
  }
}
