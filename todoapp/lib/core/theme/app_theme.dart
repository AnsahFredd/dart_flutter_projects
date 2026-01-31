import 'package:flutter/material.dart';
import 'package:todoapp/core/constants/app_colors.dart';
import 'package:todoapp/core/constants/app_dimensions.dart';

class AppTheme {
  AppTheme._(); // prevents instantiation

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,


      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.accent,
        error: AppColors.error,
        surface: AppColors.background,
      ),


      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        elevation: 0,
      ),


      // Card styles for todo items
      cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.borderRadiusMedium),
      ),
      ),


      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        bodyMedium: TextStyle(
          fontSize: 16.0,
          color: AppColors.black.withValues(alpha: 0.87),
        ),
      ),


      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.borderRadiusMedium),
          ),
        ),
      ),
    );
  }
}