import 'package:cliniq/core/theme/app_colors.dart';
import 'package:cliniq/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class DateSelector extends StatefulWidget {
  const DateSelector({
    super.key, 
    required this.onChanged,
    this.initialDate,
  });

  final ValueChanged<DateTime> onChanged;
  final DateTime? initialDate;

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  late DateTime selectedDate;
  late List<DateTime> dates;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate ?? DateTime.now();
    // Generate dates for the next 30 days
    dates = List.generate(
      30,
      (i) => DateTime.now().add(Duration(days: i)),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onChanged(selectedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${_monthName(selectedDate.month)} ${selectedDate.year}",
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w800,
                color: AppColors.secondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 90,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            itemCount: dates.length,
            itemBuilder: (context, index) {
              final date = dates[index];
              final isSelected = date.day == selectedDate.day && 
                                 date.month == selectedDate.month && 
                                 date.year == selectedDate.year;

              return GestureDetector(
                onTap: () {
                  setState(() => selectedDate = date);
                  widget.onChanged(date);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 60,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.secondary : theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected ? AppColors.secondary : (isDark ? Colors.white12 : AppColors.border.withValues(alpha: 0.5)),
                      width: 1.5,
                    ),
                    boxShadow: isSelected && !isDark
                        ? [
                            BoxShadow(
                              color: AppColors.secondary.withValues(alpha: 0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            )
                          ]
                        : [],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _dayName(date.weekday),
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: isSelected ? Colors.white.withValues(alpha: 0.8) : (isDark ? Colors.white38 : AppColors.textHint),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "${date.day}",
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                          color: isSelected ? Colors.white : theme.textTheme.titleMedium?.color,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  String _dayName(int weekday) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[weekday - 1];
  }

  String _monthName(int month) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month - 1];
  }
}
