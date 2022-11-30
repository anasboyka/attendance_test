import 'package:attendance_test/constants/constant_widget.dart';
import 'package:flutter/material.dart';

class OnboardingStep1 extends StatefulWidget {
  const OnboardingStep1({Key? key}) : super(key: key);

  @override
  State<OnboardingStep1> createState() => _OnboardingStep1State();
}

class _OnboardingStep1State extends State<OnboardingStep1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              gaphr(h: 30),
              Container(
                alignment: Alignment.center,
                height: 500,
                child: Image.asset(
                  "assets/images/step1.png",
                  fit: BoxFit.cover,
                ),
              ),
              gaphr(h: 40),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '1. Use the toggle button to display only date',
                  style: kwtextStyleRD(
                    fs: 14,
                    fw: kfbold,
                  ),
                ),
              ),
              gaphr(),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '2. Fill in the textbox to search for any user in the list. Press any user in the list to view user details',
                  style: kwtextStyleRD(
                    fs: 14,
                    fw: kfbold,
                  ),
                ),
              ),
              gaphr(),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '3. Use Add button to add new user to the attendance list',
                  style: kwtextStyleRD(
                    fs: 14,
                    fw: kfbold,
                  ),
                ),
              ),
              gaphr()
            ],
          ),
        ),
      ),
    );
  }
}
