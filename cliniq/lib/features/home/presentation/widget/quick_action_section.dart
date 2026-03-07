import 'package:cliniq/core/routing/routes.dart';
import 'package:cliniq/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class QuickActionSection extends StatelessWidget {
  const QuickActionSection({super.key, required this.onNavigate});
  final ValueChanged<int> onNavigate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         
              _QuickActionItem(
                icon: Icons.calendar_today_outlined,
                label: "Appointments",
                color: AppColors.secondary,
                onTap: () => onNavigate(1),
              ),
      
              _QuickActionItem(
                icon: Icons.description_outlined,
                label: "My Records",
                color: AppColors.secondary,
                onTap: () => onNavigate(2),
              ),
              _QuickActionItem(
                icon: Icons.emergency_outlined,
                label: "Emergency",
                color: Colors.red,
                onTap: () => Navigator.pushNamed(context, Routes.emergency),
              ),
              _QuickActionItem(
                icon: Icons.person_outline,
                label: "Find Doctor",
                color: AppColors.secondary,
                onTap: () => Navigator.pushNamed(context, Routes.finddoctor),
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
    required this.color,
    required this.onTap,
  });
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 26),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
