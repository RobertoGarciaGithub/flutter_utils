import 'package:flutter/material.dart';

import 'app_colors.dart';

class DarkTheme {
  DarkTheme._();

  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.brand600,
    dividerColor: AppColors.brand700,
    iconTheme: const IconThemeData(color: AppColors.brand700),

    colorScheme: const ColorScheme.dark(
      primary: AppColors.brand800,
      secondary: AppColors.brand400,
      surface: AppColors.brand800,
      error: AppColors.error,
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: AppColors.brand50,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: AppColors.brand50,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(color: AppColors.brand50),
      bodyMedium: TextStyle(color: AppColors.brand300),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.brand800,
      foregroundColor: AppColors.white,
    ),
  );
}
