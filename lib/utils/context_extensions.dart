import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  Locale get defaultLocale => Localizations.localeOf(this);

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
