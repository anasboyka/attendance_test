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
    if (startup) {
      return Scaffold();
    } else {
      return Scaffold();
    }
  }
}
