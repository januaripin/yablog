import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String yMMMMd(Locale locale) =>
      DateFormat.yMMMMd(locale.languageCode).format(this);
}
