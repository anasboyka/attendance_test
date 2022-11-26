import 'dart:io';

import 'package:attendance_test/presentations/pages/homepage/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return Platform.isAndroid
            ? MaterialPageRoute(
                builder: (_) => const MyHomePage(title: 'demo page'))
            : CupertinoPageRoute(
                builder: (_) => const MyHomePage(title: 'demo page'));
      default:
        return Platform.isAndroid
            ? MaterialPageRoute(
                builder: (_) => const MyHomePage(title: 'demo page'))
            : CupertinoPageRoute(
                builder: (_) => const MyHomePage(title: 'demo page'));
    }
  }
}
