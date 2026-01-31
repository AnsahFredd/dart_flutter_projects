import 'package:flutter/material.dart';
import 'package:todoapp/core/constants/app_colors.dart';

class AppTextTheme {
  AppTextTheme._();

  // Light theme text styles
  static TextTheme get lightTextTheme {
    return TextTheme(
      // appbar title
      headlineMedium: TextStyle( 
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
        letterSpacing: 0.15,
      ),


      titleLarge: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        letterSpacing: 0.15,
      ),


      titleMedium: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: AppColors.textSecondary,
        letterSpacing: 0.15,
      ),


      bodyLarge: TextStyle(
        fontSize: 16.0,
        color: AppColors.textPrimary,
        letterSpacing: 0.5,
      ),


      bodyMedium: TextStyle(
        fontSize: 14.0,
        color: AppColors.textSecondary,
        letterSpacing: 0.25,
      ),


      bodySmall: TextStyle(
        fontSize: 12.0,
        color: AppColors.textTertiary,
        letterSpacing: 0.4,
      ),


      // button text
      labelLarge: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
        letterSpacing: 1.25,
      ),


      labelMedium: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
        letterSpacing: 1.25,
      ),
    );
  }

  
  // Dartk theme text styles
  static TextTheme get darkTextTheme {
    return TextTheme(
      // appbar title
      headlineMedium: TextStyle( 
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
        letterSpacing: 0.15,
      ),


      titleLarge: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
        letterSpacing: 0.15,
      ),


      titleMedium: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: AppColors.textSecondary,
        letterSpacing: 0.15,
      ),


      bodyLarge: TextStyle(
        fontSize: 16.0,
        color: AppColors.white,
        letterSpacing: 0.5,
      ),


      bodyMedium: TextStyle(
        fontSize: 14.0,
        color: AppColors.textSecondary,
        letterSpacing: 0.25,
      ),


      bodySmall: TextStyle(
        fontSize: 12.0,
        color: AppColors.textTertiary,
        letterSpacing: 0.4,
      ),


      labelLarge: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
        letterSpacing: 1.25,
      ),
    );
  }  
}