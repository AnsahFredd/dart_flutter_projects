import 'package:flutter/material.dart';

class NotificationEntity {
  final String id;
  final String title;
  final String message;
  final String time;
  final IconData icon;
  final Color color;
  final bool isUnread;

  NotificationEntity({
    required this.id,
    required this.title,
    required this.message,
    required this.time,
    required this.icon,
    required this.color,
    this.isUnread = true,
  });
}
