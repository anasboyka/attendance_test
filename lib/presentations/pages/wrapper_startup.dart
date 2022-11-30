import 'package:attendance_test/presentations/pages/homepage/home.dart';
import 'package:attendance_test/presentations/pages/startup/onboarding_screen.dart';
import 'package:flutter/material.dart';

class WrapperStartup extends StatefulWidget {
  const WrapperStartup({Key? key}) : super(key: key);

  @override
  State<WrapperStartup> createState() => _WrapperStartupState();
}

class _WrapperStartupState extends State<WrapperStartup> {
  bool startup = false;
  @override
  Widget build(BuildContext context) {
    if (!startup) {
      return Home();
    } else {
      return OnboardingScreen();
    }
  }
}
