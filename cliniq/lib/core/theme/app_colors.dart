import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF00C9A7);

  // Secondary
  static const Color secondary = Color(0xFF6C4CF1);

  // Background
  static const Color backgroundDark = Color(0xFF0F172A);
  static const Color surface = Color(0xFFFFFFFF);

  static const Color divider = Color(0xFFE0E6EF);

  // Text
  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF64748B);
    static const Color textHint = Color(0xFFAAB4C4);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // Status
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
    static const Color emergency = Color(0xFFC62828);


  static const LinearGradient splashScrrenColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF1A6FA8), Color(0xFF00C9A7)],
  );
}
