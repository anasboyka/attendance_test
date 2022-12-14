import 'package:flutter/material.dart';

const kcWhite = Color(0xffffffff);
const kcBlack = Color(0xff000000);
const kcPrimary = Color(0xff685BA1);
const kcYellow1 = Color(0xffFBC153);
const kcYellow2 = Color(0xffFCEBCD);

MaterialColor kcPrimarySwatch = createMaterialColor(kcPrimary);
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
