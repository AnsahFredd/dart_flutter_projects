import 'package:cliniq/core/theme/app_colors.dart';
import 'package:cliniq/core/theme/app_text.dart';
import 'package:cliniq/features/find_doctor/presentation/bloc/find_doctor_bloc.dart';
import 'package:cliniq/features/find_doctor/presentation/bloc/find_doctor_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorCategoryFilter extends StatefulWidget {
  const DoctorCategoryFilter({super.key});

  @override
  State<DoctorCategoryFilter> createState() => _DoctorCategoryFilterState();
}

class _DoctorCategoryFilterState extends State<DoctorCategoryFilter> {
  final List<String> categories = [
    "All",
    "Cardiologist",
    "Dermatologist",
    "Neurologist",
    "Pediatrician",
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SizedBox(
      height: 48,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isSelected = _selectedIndex == index;
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () {
                setState(() => _selectedIndex = index);
                if (categories[index] == "All") {
                  context.read<FindDoctorBloc>().add(GetDoctorsEvent());
                } else {
                  context.read<FindDoctorBloc>().add(GetDoctorsBySpecialtyEvent(categories[index]));
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isSelected ? AppColors.primary : (isDark ? Colors.white12 : AppColors.border),
                    width: 1.5,
                  ),
                  boxShadow: isSelected && !isDark
                      ? [
                          BoxShadow(
                            color: AppColors.primary.withValues(alpha: 0.2),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          )
                        ]
                      : [],
                ),
                child: Text(
                  categories[index],
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: isSelected ? Colors.white : (isDark ? Colors.white38 : AppColors.textSecondary),
                    fontWeight: isSelected ? FontWeight.w800 : FontWeight.w700,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

