import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        brightness: Brightness.light,
        textTheme: textTheme,
        colorScheme: lightColorScheme,
      );

  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        brightness: Brightness.dark,
        textTheme: textTheme,
        colorScheme: darkColorScheme,
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

  /// Generated using Material Theme Builder
  /// https://material-foundation.github.io/material-theme-builder/#/custom
  static get lightColorScheme => const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF793FBC),
        onPrimary: Color(0xFFFFFFFF),
        primaryContainer: Color(0xFFEEDBFF),
        onPrimaryContainer: Color(0xFF2A0053),
        secondary: Color(0xFF655A6F),
        onSecondary: Color(0xFFFFFFFF),
        secondaryContainer: Color(0xFFECDDF7),
        onSecondaryContainer: Color(0xFF20182A),
        tertiary: Color(0xFF805159),
        onTertiary: Color(0xFFFFFFFF),
        tertiaryContainer: Color(0xFFFFD9DE),
        onTertiaryContainer: Color(0xFF321018),
        error: Color(0xFFBA1A1A),
        errorContainer: Color(0xFFFFDAD6),
        onError: Color(0xFFFFFFFF),
        onErrorContainer: Color(0xFF410002),
        background: Color(0xFFFFFBFF),
        onBackground: Color(0xFF1D1B1E),
        surface: Color(0xFFFFFBFF),
        onSurface: Color(0xFF1D1B1E),
        surfaceVariant: Color(0xFFE8E0EB),
        onSurfaceVariant: Color(0xFF4A454E),
        outline: Color(0xFF7B757F),
        onInverseSurface: Color(0xFFF5EFF4),
        inverseSurface: Color(0xFF322F33),
        inversePrimary: Color(0xFFDAB9FF),
        shadow: Color(0xFF000000),
      );

  /// Generated using Material Theme Builder
  /// https://material-foundation.github.io/material-theme-builder/#/custom
  static get darkColorScheme => const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xFFDAB9FF),
        onPrimary: Color(0xFF460084),
        primaryContainer: Color(0xFF6022A3),
        onPrimaryContainer: Color(0xFFEEDBFF),
        secondary: Color(0xFFCFC1DA),
        onSecondary: Color(0xFF362D40),
        secondaryContainer: Color(0xFF4D4357),
        onSecondaryContainer: Color(0xFFECDDF7),
        tertiary: Color(0xFFF2B7C0),
        onTertiary: Color(0xFF4B252C),
        tertiaryContainer: Color(0xFF653B42),
        onTertiaryContainer: Color(0xFFFFD9DE),
        error: Color(0xFFFFB4AB),
        errorContainer: Color(0xFF93000A),
        onError: Color(0xFF690005),
        onErrorContainer: Color(0xFFFFDAD6),
        background: Color(0xFF1D1B1E),
        onBackground: Color(0xFFE7E1E5),
        surface: Color(0xFF1D1B1E),
        onSurface: Color(0xFFE7E1E5),
        surfaceVariant: Color(0xFF4A454E),
        onSurfaceVariant: Color(0xFFCCC4CF),
        outline: Color(0xFF958E98),
        onInverseSurface: Color(0xFF1D1B1E),
        inverseSurface: Color(0xFFE7E1E5),
        inversePrimary: Color(0xFF793FBC),
        shadow: Color(0xFF000000),
      );
}
