import 'package:flutter/material.dart';

class AppTheme{
  static ThemeData lightThemeColor = ThemeData(
    primaryColor: Colors.teal,
    appBarTheme: const AppBarTheme(color: Colors.teal),
    brightness: Brightness.light
  );
}