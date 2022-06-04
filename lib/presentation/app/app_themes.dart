import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        brightness: Brightness.light,
        textTheme: textTheme,
      );

  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        brightness: Brightness.dark,
        textTheme: textTheme,
      );

  static TextTheme get textTheme => TextTheme(
        displayLarge: textStyle(fontSize: 57),
        displayMedium: textStyle(fontSize: 45),
        displaySmall: textStyle(fontSize: 36),
        headlineLarge: textStyle(fontSize: 32),
        headlineMedium: textStyle(fontSize: 28),
        headlineSmall: textStyle(fontSize: 24),
        titleLarge: textStyle(fontSize: 22),
        titleMedium: textStyle(fontSize: 16, fontWeight: FontWeight.w500),
        titleSmall: textStyle(fontSize: 14, fontWeight: FontWeight.w500),
        bodyLarge: textStyle(fontSize: 16),
        bodyMedium: textStyle(),
        bodySmall: textStyle(fontSize: 12),
        labelLarge: textStyle(fontSize: 14, fontWeight: FontWeight.w500),
        labelMedium: textStyle(fontSize: 12, fontWeight: FontWeight.w500),
        labelSmall: textStyle(fontSize: 11, fontWeight: FontWeight.w500),
      );

  static TextStyle textStyle({
    Color? color,
    double fontSize = 14,
    double letterSpacing = 0.3,
    double? height,
    FontWeight? fontWeight,
  }) =>
      TextStyle(
        color: color,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        height: height ?? (fontSize + 10),
        fontWeight: fontWeight,
      );
}
