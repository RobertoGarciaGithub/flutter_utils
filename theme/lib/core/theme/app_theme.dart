import 'package:flutter/material.dart';
import 'package:theme/core/theme/light_theme.dart';
import 'package:theme/core/theme/dark_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => LightTheme.theme;
  static ThemeData get dark => DarkTheme.theme;
}
