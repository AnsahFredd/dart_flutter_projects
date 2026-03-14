import 'package:cliniq/features/appointments/domain/entities/appointment.dart';
import 'package:cliniq/features/appointments/presentation/widgets/appointment_card.dart';
import 'package:flutter/material.dart';

class AppointmentList extends StatelessWidget {
  final List<Appointment> appointments;
  const AppointmentList({super.key, required this.appointments});

  @override
  Widget build(BuildContext context) {
    if (appointments.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calendar_today_outlined, size: 56, color: Colors.grey.shade300),
            const SizedBox(height: 12),
            Text(
              "No appointments here",
              style: TextStyle(color: Colors.grey.shade400, fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: appointments.length,
      itemBuilder: (context, index) => AppointmentCard(appointment: appointments[index]),
    );
  }
}