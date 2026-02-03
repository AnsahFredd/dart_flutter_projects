import 'package:flutter/material.dart';
import 'package:todoapp/core/constants/app_colors.dart';
import 'package:todoapp/core/constants/app_dimensions.dart';
import 'package:todoapp/core/theme/button_scheme.dart';
import 'package:todoapp/core/theme/color_scheme.dart';
import 'package:todoapp/core/theme/text_theme.dart';

class AppTheme {
  AppTheme._(); // prevents instantiation

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,

      colorScheme: AppColorScheme.lightColorScheme, 

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

      textTheme: AppTextTheme.lightTextTheme,
      elevatedButtonTheme: AppButtonTheme.elevatedButtonTheme,
      outlinedButtonTheme: AppButtonTheme.outlinedButtonTheme,
      textButtonTheme: AppButtonTheme.textButtonTheme,

    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.darkBackground,


      colorScheme: AppColorScheme.darkColorScheme,
      textTheme: AppTextTheme.darkTextTheme,

       cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.borderRadiusMedium),
      ),
      ),

      elevatedButtonTheme: AppButtonTheme.elevatedButtonTheme,
      outlinedButtonTheme: AppButtonTheme.outlinedButtonTheme,
      textButtonTheme: AppButtonTheme.textButtonTheme,
      
    );
  }

  }