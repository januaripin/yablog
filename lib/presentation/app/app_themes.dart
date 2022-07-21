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
        height: height ?? (fontSize + 10) / fontSize,
        fontWeight: fontWeight,
      );

  /// Generated using Material Theme Builder
  /// https://material-foundation.github.io/material-theme-builder/#/custom
  static get lightColorScheme => const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF006493),
        onPrimary: Color(0xFFFFFFFF),
        primaryContainer: Color(0xFFCAE6FF),
        onPrimaryContainer: Color(0xFF001E30),
        secondary: Color(0xFF50606F),
        onSecondary: Color(0xFFFFFFFF),
        secondaryContainer: Color(0xFFD3E5F6),
        onSecondaryContainer: Color(0xFF0C1D29),
        tertiary: Color(0xFF65587B),
        onTertiary: Color(0xFFFFFFFF),
        tertiaryContainer: Color(0xFFEBDCFF),
        onTertiaryContainer: Color(0xFF201634),
        error: Color(0xFFBA1A1A),
        errorContainer: Color(0xFFFFDAD6),
        onError: Color(0xFFFFFFFF),
        onErrorContainer: Color(0xFF410002),
        background: Color(0xFFFCFCFF),
        onBackground: Color(0xFF1A1C1E),
        surface: Color(0xFFFCFCFF),
        onSurface: Color(0xFF1A1C1E),
        surfaceVariant: Color(0xFFDDE3EA),
        onSurfaceVariant: Color(0xFF41474D),
        outline: Color(0xFF72787E),
        onInverseSurface: Color(0xFFF0F0F3),
        inverseSurface: Color(0xFF2E3133),
        inversePrimary: Color(0xFF8DCDFF),
        shadow: Color(0xFF000000),
        surfaceTint: Color(0xFF006493),
      );

  /// Generated using Material Theme Builder
  /// https://material-foundation.github.io/material-theme-builder/#/custom
  static get darkColorScheme => const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xFF8DCDFF),
        onPrimary: Color(0xFF00344F),
        primaryContainer: Color(0xFF004B70),
        onPrimaryContainer: Color(0xFFCAE6FF),
        secondary: Color(0xFFB7C9D9),
        onSecondary: Color(0xFF22323F),
        secondaryContainer: Color(0xFF384956),
        onSecondaryContainer: Color(0xFFD3E5F6),
        tertiary: Color(0xFFCFC0E8),
        onTertiary: Color(0xFF362B4A),
        tertiaryContainer: Color(0xFF4D4162),
        onTertiaryContainer: Color(0xFFEBDCFF),
        error: Color(0xFFFFB4AB),
        errorContainer: Color(0xFF93000A),
        onError: Color(0xFF690005),
        onErrorContainer: Color(0xFFFFDAD6),
        background: Color(0xFF1A1C1E),
        onBackground: Color(0xFFE2E2E5),
        surface: Color(0xFF1A1C1E),
        onSurface: Color(0xFFE2E2E5),
        surfaceVariant: Color(0xFF41474D),
        onSurfaceVariant: Color(0xFFC1C7CE),
        outline: Color(0xFF8B9198),
        onInverseSurface: Color(0xFF1A1C1E),
        inverseSurface: Color(0xFFE2E2E5),
        inversePrimary: Color(0xFF006493),
        shadow: Color(0xFF000000),
        surfaceTint: Color(0xFF8DCDFF),
      );
}
