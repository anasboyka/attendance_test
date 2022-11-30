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
      body: Container(
        child: Center(
          child: const Text('step 2'),
        ),
      ),
    );
  }
}
