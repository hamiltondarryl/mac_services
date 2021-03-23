import 'package:flutter/material.dart';

class ColorsSys {
  static Color red = Color(0xFFee5253);
  static Color grey = Color(0xFFF1F1F1);
  static Color black = Color(0xFF222f3e);
  static Color yellow = Color(0xFFfeca57);
  static Color blue = Color(0xFF2e86de);
  static Color green = Color(0xFF10ac84);

  static const MaterialColor redSy = MaterialColor(
    _bluePrimaryValue,
    <int, Color>{
      50: Color(0xFFee5253),
      100: Color(0xFFee5253),
      200: Color(0xFFee5253),
      300: Color(0xFFee5253),
      400: Color(0xFFee5253),
      500: Color(_bluePrimaryValue),
      600: Color(0xFFee5253),
      700: Color(0xFFee5253),
      800: Color(0xFFee5253),
      900: Color(0xFFee5253),
    },
  );
  static const int _bluePrimaryValue = 0xFFee5253;
}
