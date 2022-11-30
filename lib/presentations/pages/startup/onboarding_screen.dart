import 'package:attendance_test/constants/constant_widget.dart';
import 'package:attendance_test/data/local/shared_prefences.dart';
import 'package:attendance_test/presentations/pages/startup/onboarding_screen/onboarding_step1.dart';
import 'package:attendance_test/presentations/pages/startup/onboarding_screen/onboarding_step2.dart';
import 'package:attendance_test/presentations/pages/startup/onboarding_screen/onboarding_step3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 80.h),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: [
            OnboardingStep1(),
            OnboardingStep2(),
            OnboardingStep3(),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 80,
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: _currentIndex != 0
                  ? Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          controller.previousPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: const Text('PREVIOUS'),
                      ),
                    )
                  : empty(),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  onDotClicked: (index) => controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.centerRight,
                child: _currentIndex != 2
                    ? TextButton(
                        onPressed: () {
                          controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: const Text('NEXT'),
                      )
                    : TextButton(
                        onPressed: () async {
                          await Spreferences.setStartup(false);
                          Navigator.of(context).pushReplacementNamed('/');
                        },
                        child: const Text('CONTINUE'),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
