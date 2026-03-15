import 'package:flutter/material.dart';

enum PaymentStatus { completed, pending, failed }

class PaymentTransaction {
  final String id;
  final String title;
  final String category;
  final double amount;
  final DateTime date;
  final PaymentStatus status;
  final IconData icon;

  PaymentTransaction({
    required this.id,
    required this.title,
    required this.category,
    required this.amount,
    required this.date,
    required this.status,
    required this.icon,
  });
}
