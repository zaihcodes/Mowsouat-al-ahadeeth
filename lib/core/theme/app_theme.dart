import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color(0xFFEDEEEE),
      brightness: Brightness.light,
      primaryContainer: Color(0xFFEDEEEE),
      onPrimaryContainer: Colors.black,
      secondaryContainer: Color(0xFFEDEEEE), //Color(0xFFDCDCDD),
      onSecondaryContainer: Colors.black,
      surface: Color(0xFFFFFFFF),
      onSurface: Colors.black,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color(0xFF00FA85),
      brightness: Brightness.dark,
    ),
  );
}
