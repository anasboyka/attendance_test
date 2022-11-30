import 'package:attendance_test/constants/constant_widget.dart';
import 'package:flutter/material.dart';

class OnboardingStep3 extends StatefulWidget {
  const OnboardingStep3({Key? key}) : super(key: key);

  @override
  State<OnboardingStep3> createState() => _OnboardingStep3State();
}

class _OnboardingStep3State extends State<OnboardingStep3> {
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
                  "assets/images/step3.png",
                  fit: BoxFit.cover,
                ),
              ),
              gaphr(h: 40),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '1. Use the share button in user detail page to share all of the information related to user',
                  style: kwtextStyleRD(
                    fs: 14,
                    fw: kfbold,
                  ),
                ),
              ),
              gaphr(),
            ],
          ),
        ),
      ),
    );
  }
}
