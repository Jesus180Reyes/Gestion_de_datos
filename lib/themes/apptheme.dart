import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.grey[200],
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
