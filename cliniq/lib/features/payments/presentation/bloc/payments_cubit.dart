import 'package:cliniq/features/payments/domain/entities/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentsState {
  final List<PaymentTransaction> transactions;
  final double totalBalance;

  PaymentsState({
    required this.transactions,
    required this.totalBalance,
  });
}

class PaymentsCubit extends Cubit<PaymentsState> {
  PaymentsCubit() : super(PaymentsState(
    transactions: [
      PaymentTransaction(
        id: "1",
        title: "General Consultation",
        category: "Medical",
        amount: 50.00,
        date: DateTime.now().subtract(const Duration(days: 1)),
        status: PaymentStatus.completed,
        icon: Icons.medical_services_rounded,
      ),
      PaymentTransaction(
        id: "2",
        title: "Blood Test - Lab",
        category: "Laboratory",
        amount: 120.50,
        date: DateTime.now().subtract(const Duration(days: 3)),
        status: PaymentStatus.completed,
        icon: Icons.biotech_rounded,
      ),
      PaymentTransaction(
        id: "3",
        title: "Pharmacy Bill #4521",
        category: "Pharmacy",
        amount: 35.20,
        date: DateTime.now().subtract(const Duration(days: 5)),
        status: PaymentStatus.pending,
        icon: Icons.medication_rounded,
      ),
    ],
    totalBalance: 1245.80,
  ));

  void addTransaction(PaymentTransaction transaction) {
    emit(PaymentsState(
      transactions: [transaction, ...state.transactions],
      totalBalance: state.totalBalance + transaction.amount,
    ));
  }
}
