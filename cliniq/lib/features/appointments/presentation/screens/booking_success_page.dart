import 'package:cliniq/core/routing/routes.dart';
import 'package:cliniq/core/theme/app_colors.dart';
import 'package:cliniq/core/theme/app_text.dart';
import 'package:cliniq/features/appointments/domain/entities/appointment.dart';
import 'package:flutter/material.dart';

class BookingSuccessPage extends StatelessWidget {
  final Appointment appointment;

  const BookingSuccessPage({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // Success Animation/Icon
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.success.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.check_circle_rounded,
                    color: AppColors.success,
                    size: 60,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                "Appointment Booked!",
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                "Your appointment with ${appointment.doctorName} has been successfully booked.",
                style: theme.textTheme.bodySmall?.copyWith(
                  color: isDark ? Colors.white38 : AppColors.textSecondary,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // Appointment Summary Card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: isDark ? Colors.white12 : AppColors.border),
                ),
                child: Column(
                  children: [
                    _buildSummaryItem(
                      context,
                      Icons.calendar_today_rounded,
                      "Date",
                      "${appointment.dateTime.day}/${appointment.dateTime.month}/${appointment.dateTime.year}",
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Divider(height: 1, color: AppColors.border),
                    ),
                    _buildSummaryItem(
                      context,
                      Icons.access_time_rounded,
                      "Time",
                      "${appointment.dateTime.hour}:${appointment.dateTime.minute.toString().padLeft(2, '0')}",
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Divider(height: 1, color: AppColors.border),
                    ),
                    _buildSummaryItem(
                      context,
                      Icons.location_on_rounded,
                      "Type",
                      appointment.type.label,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // Action Buttons
              ElevatedButton(
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.maainScreen,
                  (route) => false,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 0,
                ),
                child: const Text(
                  "Back to Home",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                   Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.maainScreen,
                    (route) => false,
                  );
                  // We could potentially trigger a tab change to appointments here if we pass arguments to mainScreen
                },
                child: Text(
                  "View My Appointments",
                  style: TextStyle(
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryItem(BuildContext context, IconData icon, String label, String value) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.secondary),
        const SizedBox(width: 12),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: isDark ? Colors.white38 : AppColors.textSecondary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}
