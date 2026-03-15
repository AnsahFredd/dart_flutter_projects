import 'package:cliniq/core/theme/app_colors.dart';
import 'package:cliniq/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.surface,
        error: AppColors.error,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: AppColors.textPrimary,
        outline: AppColors.border,
      ),
      textTheme: _textTheme(AppColors.textPrimary, AppColors.textSecondary),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        foregroundColor: AppColors.textPrimary,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        titleTextStyle: AppText.titleLarge.copyWith(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w800,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: 1,
        space: 1,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          textStyle: AppText.titleMedium.copyWith(fontWeight: FontWeight.bold),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
      inputDecorationTheme: _inputDecorationTheme(AppColors.surface, AppColors.border),
      cardTheme: _cardTheme(AppColors.surface),
      iconTheme: const IconThemeData(color: AppColors.textPrimary),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: Color(0xFF1E293B),
        error: AppColors.error,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.white,
        outline: Colors.white12,
      ),
      textTheme: _textTheme(Colors.white, Colors.white70),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        foregroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: AppText.titleLarge.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w800,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      dividerTheme: DividerThemeData(
        color: Colors.white.withValues(alpha: 0.1),
        thickness: 1,
        space: 1,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          textStyle: AppText.titleMedium.copyWith(fontWeight: FontWeight.bold),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
      inputDecorationTheme: _inputDecorationTheme(const Color(0xFF1E293B), Colors.white.withValues(alpha: 0.1)),
      cardTheme: _cardTheme(const Color(0xFF1E293B)),
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }

  static TextTheme _textTheme(Color primary, Color secondary) {
    return TextTheme(
      displayLarge: AppText.displayLarge.copyWith(color: primary),
      displayMedium: AppText.displayMedium.copyWith(color: primary),
      displaySmall: AppText.displaySmall.copyWith(color: primary),
      headlineLarge: AppText.headlineLarge.copyWith(color: primary),
      headlineMedium: AppText.headlineMedium.copyWith(color: primary),
      headlineSmall: AppText.headlineSmall.copyWith(color: primary),
      titleLarge: AppText.titleLarge.copyWith(color: primary),
      titleMedium: AppText.titleMedium.copyWith(color: primary),
      titleSmall: AppText.titleSmall.copyWith(color: primary),
      labelLarge: AppText.titleSmall.copyWith(color: primary),
      labelMedium: AppText.subtitleMedium.copyWith(color: secondary),
      labelSmall: AppText.subtitleSmall.copyWith(color: secondary),
      bodyLarge: AppText.subtitleLarge.copyWith(color: primary),
      bodyMedium: AppText.subtitleMedium.copyWith(color: secondary),
      bodySmall: AppText.subtitleSmall.copyWith(color: secondary),
    );
  }

  static InputDecorationTheme _inputDecorationTheme(Color fillColor, Color borderColor) {
    return InputDecorationTheme(
      filled: true,
      fillColor: fillColor,
      hintStyle: AppText.subtitleSmall.copyWith(color: AppColors.textHint),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.error),
      ),
    );
  }

  static CardThemeData _cardTheme(Color color) {
    return CardThemeData(
      color: color,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    );
  }
}

