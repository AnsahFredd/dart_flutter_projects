import 'package:cliniq/core/theme/app_colors.dart';
import 'package:cliniq/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Notifications",
          style: AppText.headlineSmall.copyWith(color: AppColors.textPrimary),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Mark all as read",
              style: AppText.titleSmall.copyWith(color: AppColors.secondary),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          _buildSectionHeader("Today"),
          _NotificationItem(
            icon: Icons.calendar_today_rounded,
            color: Colors.blue,
            title: "Appointment Reminder",
            message: "Your appointment with Dr. Sarah is in 30 minutes.",
            time: "32 m ago",
            isUnread: true,
          ),
          _NotificationItem(
            icon: Icons.medication_rounded,
            color: Colors.orange,
            title: "Medication Alert",
            message: "It's time for your evening dose of Vitamin D.",
            time: "2 h ago",
            isUnread: true,
          ),
          const SizedBox(height: 20),
          _buildSectionHeader("Yesterday"),
          _NotificationItem(
            icon: Icons.check_circle_rounded,
            color: Colors.green,
            title: "Lab Results Ready",
            message: "Your blood test results from Monday are now available.",
            time: "1 d ago",
          ),
          _NotificationItem(
            icon: Icons.payment_rounded,
            color: Colors.purple,
            title: "Payment Successful",
            message: "Your subscription for Premium Plan has been renewed.",
            time: "1 d ago",
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, top: 8),
      child: Text(
        title,
        style: AppText.titleSmall.copyWith(color: AppColors.textHint, letterSpacing: 1),
      ),
    );
  }
}

class _NotificationItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String message;
  final String time;
  final bool isUnread;

  const _NotificationItem({
    required this.icon,
    required this.color,
    required this.title,
    required this.message,
    required this.time,
    this.isUnread = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isUnread ? AppColors.surface : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isUnread ? AppColors.secondary.withValues(alpha: 0.1) : AppColors.border.withValues(alpha: 0.5),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: AppText.titleMedium.copyWith(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Text(
                      time,
                      style: AppText.subtitleSmall.copyWith(fontSize: 11, color: AppColors.textHint),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: AppText.subtitleSmall.copyWith(height: 1.4, color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}