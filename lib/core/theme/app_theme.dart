import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.teal,
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: const ColorScheme.light(
      primary: AppColors.teal,
      secondary: AppColors.navy,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.teal,
      foregroundColor: Colors.white,
      centerTitle: true,
    ),
    textTheme: const TextTheme(
      headlineLarge: AppTextStyles.heading,
      bodyLarge: AppTextStyles.body,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.teal,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}