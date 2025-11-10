import 'package:flutter/material.dart';

class CAppTheme {
  CAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Color(0xFF0004FF),
    scaffoldBackgroundColor: Color(0xFFFFFFFF),
    textTheme: TextTheme(),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Color(0xFF0004FF),
    scaffoldBackgroundColor: Color(0xFF000000),
    textTheme: TextTheme(),
  );
}
