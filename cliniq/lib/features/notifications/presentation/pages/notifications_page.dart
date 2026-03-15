import 'package:cliniq/core/theme/app_colors.dart';
import 'package:cliniq/core/theme/app_text.dart';
import 'package:cliniq/features/notifications/presentation/bloc/notification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Notifications",
          style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900),
        ),
        actions: [
          if (context.watch<NotificationCubit>().state.notifications.isNotEmpty)
            TextButton(
              onPressed: () => _showClearConfirmation(context),
              child: const Text(
                "Clear all",
                style: TextStyle(color: AppColors.error, fontWeight: FontWeight.w800),
              ),
            ),
          const SizedBox(width: 8),
        ],
      ),
      body: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          if (state.notifications.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.notifications_off_outlined, size: 64, color: AppColors.textHint.withValues(alpha: 0.3)),
                  const SizedBox(height: 16),
                  Text("No notifications yet", style: theme.textTheme.titleMedium?.copyWith(color: AppColors.textHint)),
                ],
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            itemCount: state.notifications.length,
            itemBuilder: (context, index) {
              final item = state.notifications[index];
              return _NotificationItem(
                id: item.id,
                icon: item.icon,
                color: item.color,
                title: item.title,
                message: item.message,
                time: item.time,
                isUnread: item.isUnread,
              );
            },
          );
        },
      ),
    );
  }

  void _showClearConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Clear Notifications", style: TextStyle(fontWeight: FontWeight.bold)),
        content: const Text("Are you sure you want to clear all notifications?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Cancel")),
          TextButton(
            onPressed: () {
              context.read<NotificationCubit>().clearAll();
              Navigator.pop(ctx);
            },
            child: const Text("Clear All", style: TextStyle(color: AppColors.error)),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(ThemeData theme, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, top: 8),
      child: Text(
        title,
        style: theme.textTheme.titleSmall?.copyWith(
          color: AppColors.textHint,
          letterSpacing: 1,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _NotificationItem extends StatelessWidget {
  final String id;
  final IconData icon;
  final Color color;
  final String title;
  final String message;
  final String time;
  final bool isUnread;

  const _NotificationItem({
    required this.id,
    required this.icon,
    required this.color,
    required this.title,
    required this.message,
    required this.time,
    this.isUnread = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isUnread 
            ? (isDark ? theme.colorScheme.secondary.withValues(alpha: 0.1) : AppColors.surface)
            : theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isUnread 
              ? AppColors.secondary.withValues(alpha: 0.2) 
              : (isDark ? Colors.white12 : AppColors.border.withValues(alpha: 0.5)),
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
                    Expanded(
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w800, 
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Text(
                      time,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 11, 
                        color: isDark ? Colors.white38 : AppColors.textHint,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: theme.textTheme.bodySmall?.copyWith(
                    height: 1.4, 
                    color: isDark ? Colors.white70 : AppColors.textSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => context.read<NotificationCubit>().removeNotification(id),
            icon: const Icon(Icons.close_rounded, size: 18),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            color: isDark ? Colors.white24 : AppColors.textHint,
          ),
        ],
      ),
    );
  }
}