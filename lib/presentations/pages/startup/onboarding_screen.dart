import 'package:attendance_test/presentations/pages/startup/onboarding_screen/onboarding_step1.dart';
import 'package:attendance_test/presentations/pages/startup/onboarding_screen/onboarding_step2.dart';
import 'package:attendance_test/presentations/pages/startup/onboarding_screen/onboarding_step3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(bottom: 80.h),
      child: PageView(
        children: [
          OnboardingStep1(),
          OnboardingStep2(),
          OnboardingStep3(),
        ],
      ),
    ));
  }
}
