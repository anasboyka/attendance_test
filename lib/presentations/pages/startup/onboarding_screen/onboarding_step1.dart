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
      body: Container(
        child: Center(
          child: const Text('step 1'),
        ),
      ),
    );
  }
}
