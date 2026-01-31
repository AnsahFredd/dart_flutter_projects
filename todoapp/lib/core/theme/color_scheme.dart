import 'package:flutter/material.dart';
import 'package:todoapp/core/constants/app_colors.dart';  

class AppColorScheme {
  AppColorScheme._();

  static ColorScheme get lightColorScheme {
    return ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.accent,
      error: AppColors.error,
      surface: AppColors.white,
      onPrimary: AppColors.white,
      onSecondary: AppColors.white,
      onError: AppColors.white,
      onSurface: AppColors.black,
    );
  }

  static ColorScheme get darkColorScheme {
    return ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.accent,
      error: AppColors.error,
      surface: AppColors.darkSurface,
      onPrimary: AppColors.white,
      onSecondary: AppColors.white,
      onError: AppColors.white,
      onSurface: AppColors.white,
    );
  }
}