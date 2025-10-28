import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme => ThemeData(
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    fontFamily: 'Montserrat',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF222222)),
      titleMedium: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xFF7B7B7B)),
      bodyMedium: TextStyle(
          fontSize: 16, fontWeight: FontWeight.normal, color: Color(0xFF222222)),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Color(0xFF222222),
      elevation: 0,
      centerTitle: true,
    ),
  );
}