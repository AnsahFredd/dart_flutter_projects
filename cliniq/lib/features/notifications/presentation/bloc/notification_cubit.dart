import 'package:cliniq/features/notifications/domain/entities/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationState {
  final List<NotificationEntity> notifications;
  NotificationState(this.notifications);
}

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationState([
    NotificationEntity(
      id: '1',
      title: "Appointment Reminder",
      message: "Your appointment with Dr. Sarah is in 30 minutes.",
      time: "32 m ago",
      icon: Icons.calendar_today_rounded,
      color: Colors.blue,
      isUnread: true,
    ),
    NotificationEntity(
      id: '2',
      title: "Medication Alert",
      message: "It's time for your evening dose of Vitamin D.",
      time: "2 h ago",
      icon: Icons.medication_rounded,
      color: Colors.orange,
      isUnread: true,
    ),
  ]));

  void markAllAsRead() {
    final newList = state.notifications.map((n) => NotificationEntity(
      id: n.id,
      title: n.title,
      message: n.message,
      time: n.time,
      icon: n.icon,
      color: n.color,
      isUnread: false,
    )).toList();
    emit(NotificationState(newList));
  }

  void addNotification(NotificationEntity notification) {
    emit(NotificationState([notification, ...state.notifications]));
  }

  void removeNotification(String id) {
    final newList = state.notifications.where((n) => n.id != id).toList();
    emit(NotificationState(newList));
  }

  void clearAll() {
    emit(NotificationState([]));
  }
}
