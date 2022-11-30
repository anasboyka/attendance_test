import 'package:attendance_test/data/local/shared_prefences.dart';
import 'package:attendance_test/presentations/pages/homepage/home.dart';
import 'package:attendance_test/presentations/pages/startup/onboarding_screen.dart';
import 'package:flutter/material.dart';

class WrapperStartup extends StatefulWidget {
  const WrapperStartup({Key? key}) : super(key: key);

  @override
  State<WrapperStartup> createState() => _WrapperStartupState();
}

class _WrapperStartupState extends State<WrapperStartup> {
  bool? startup = Spreferences.getStartup();
  @override
  Widget build(BuildContext context) {
    if (startup != null && startup == false) {
      return Home();
    } else {
      return OnboardingScreen();
    }
  }
}
