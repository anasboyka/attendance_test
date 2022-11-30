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
      body: Container(
        child: Center(
          child: const Text('step 3'),
        ),
      ),
    );
  }
}
