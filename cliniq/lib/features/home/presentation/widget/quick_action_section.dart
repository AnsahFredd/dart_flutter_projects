import 'package:cliniq/core/routing/routes.dart';
import 'package:cliniq/core/theme/app_colors.dart';
import 'package:cliniq/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class QuickActionSection extends StatelessWidget {
  const QuickActionSection({super.key, required this.onNavigate});
  final ValueChanged<int> onNavigate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _QuickActionItem(
            icon: Icons.calendar_month_rounded,
            label: "Schedule",
            gradient: AppColors.secondaryGradient,
            onTap: () => onNavigate(1),
          ),
          _QuickActionItem(
            icon: Icons.description_rounded,
            label: "Records",
            gradient: AppColors.primaryGradient,
            onTap: () => onNavigate(2),
          ),
          _QuickActionItem(
            icon: Icons.person_search_rounded,
            label: "Find Dr",
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFFB923C), Color(0xFFF97316)],
            ),
            onTap: () => Navigator.pushNamed(context, Routes.finddoctor),
          ),
          _QuickActionItem(
            icon: Icons.emergency_rounded,
            label: "SOS",
            gradient: AppColors.emergencyGradient,
            onTap: () => Navigator.pushNamed(context, Routes.emergency),
          ),
        ],
      ),
    );
  }
}

class _QuickActionItem extends StatelessWidget {
  const _QuickActionItem({
    required this.icon,
    required this.label,
    required this.gradient,
    required this.onTap,
  });
  final IconData icon;
  final String label;
  final Gradient gradient;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(22),
              boxShadow: isDark ? [] : [
                BoxShadow(
                  color: (gradient as LinearGradient).colors.first.withValues(alpha: 0.25),
                  blurRadius: 18,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Icon(icon, color: Colors.white, size: 30),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

