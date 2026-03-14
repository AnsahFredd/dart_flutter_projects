import 'package:cliniq/core/theme/app_colors.dart';
import 'package:cliniq/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class SlotSelectorGrid extends StatefulWidget {
  const SlotSelectorGrid({super.key, required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  State<SlotSelectorGrid> createState() => _SlotSelectorGridState();
}

class _SlotSelectorGridState extends State<SlotSelectorGrid> {
  String? selectedTime;

  final List<String> timeSlots = [
    '09:00 AM', '09:30 AM', '10:00 AM',
    '11:00 AM', '12:30 PM', '02:00 PM',
    '03:30 PM', '04:00 PM', '05:00 PM',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: timeSlots.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 2.2,
      ),
      itemBuilder: (context, index) {
        final time = timeSlots[index];
        final isSelected = time == selectedTime;

        return GestureDetector(
          onTap: () {
            setState(() => selectedTime = time);
            widget.onChanged(time);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.secondary : theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? AppColors.secondary : (isDark ? Colors.white12 : AppColors.border.withValues(alpha: 0.5)),
                width: 1.5,
              ),
              boxShadow: isSelected && !isDark
                  ? [
                      BoxShadow(
                        color: AppColors.secondary.withValues(alpha: 0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      )
                    ]
                  : [],
            ),
            child: Text(
              time,
              style: theme.textTheme.bodySmall?.copyWith(
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.w900 : FontWeight.w800,
                color: isSelected ? Colors.white : theme.textTheme.titleMedium?.color,
              ),
            ),
          ),
        );
      },
    );
  }
}