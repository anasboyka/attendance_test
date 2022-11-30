import 'package:attendance_test/constants/constant_widget.dart';
import 'package:flutter/material.dart';

class OnboardingStep2 extends StatefulWidget {
  const OnboardingStep2({Key? key}) : super(key: key);

  @override
  State<OnboardingStep2> createState() => _OnboardingStep2State();
}

class _OnboardingStep2State extends State<OnboardingStep2> {
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
                  "assets/images/step2.png",
                  fit: BoxFit.cover,
                ),
              ),
              gaphr(h: 40),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '4. Fill in all the required detail and press add button to add new attendance to the list',
                  style: kwtextStyleRD(
                    fs: 14,
                    fw: kfbold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
