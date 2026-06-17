import 'package:flutter/material.dart';

import 'app_colors.dart';

class LightTheme {
  LightTheme._();

  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.brand50,
    dividerColor: AppColors.brand200,
    iconTheme: const IconThemeData(color: AppColors.brand700),

    colorScheme: const ColorScheme.light(
      primary: AppColors.brand800,
      secondary: AppColors.brand700,
      surface: AppColors.white,
      error: AppColors.error,
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: AppColors.brand900,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: AppColors.brand900,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(color: AppColors.brand900),
      bodyMedium: TextStyle(color: AppColors.brand600),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.brand300,
      foregroundColor: AppColors.brand900,
    ),
  );
}
