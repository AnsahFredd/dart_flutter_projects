import 'package:cliniq/core/theme/app_colors.dart';
import 'package:cliniq/features/appointments/domain/entities/appointment.dart';
import 'package:flutter/material.dart';

class AppointmentTypeSelector extends StatefulWidget {
  const AppointmentTypeSelector({super.key, required this.onChanged});

  final ValueChanged<AppointmentType> onChanged;

  @override
  State<AppointmentTypeSelector> createState() =>
      _AppointmentTypeSelectorState();
}

class _AppointmentTypeSelectorState extends State<AppointmentTypeSelector> {
  AppointmentType selectedType = AppointmentType.inPerson;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withValues(alpha: 0.05) : AppColors.surface2,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: AppointmentType.values.map((type) {
          final isSelected = selectedType == type;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() => selectedType = type);
                widget.onChanged(type);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected 
                      ? (isDark ? Colors.white.withValues(alpha: 0.1) : Colors.white)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: isSelected && !isDark
                      ? [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          )
                        ]
                      : [],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      type.icon,
                      size: 18,
                      color: isSelected ? AppColors.secondary : (isDark ? Colors.white38 : AppColors.textHint),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      type.label,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: isSelected ? theme.textTheme.titleMedium?.color : (isDark ? Colors.white38 : AppColors.textSecondary),
                        fontWeight: isSelected ? FontWeight.w800 : FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
