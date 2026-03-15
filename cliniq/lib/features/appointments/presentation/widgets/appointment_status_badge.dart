import 'package:cliniq/core/theme/app_colors.dart';
import 'package:cliniq/features/appointments/domain/entities/appointment.dart';
import 'package:flutter/material.dart';

class AppointmentStatusBadge extends StatelessWidget {
  final AppointmentStatus status;
  const AppointmentStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    String label;

    switch (status) {
      case AppointmentStatus.upcoming:
        color = AppColors.secondary;
        label = "Upcoming";
        break;
      case AppointmentStatus.completed:
        color = AppColors.success;
        label = "Completed";
        break;
      case AppointmentStatus.cancelled:
        color = AppColors.error;
        label = "Cancelled";
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          fontSize: 10,
          fontWeight: FontWeight.w900,
          color: color,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}