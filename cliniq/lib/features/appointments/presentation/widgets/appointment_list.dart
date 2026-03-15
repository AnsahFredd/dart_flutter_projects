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
            Icon(
              Icons.calendar_today_outlined, 
              size: 56, 
              color: Theme.of(context).brightness == Brightness.dark ? Colors.white12 : Colors.grey.shade300
            ),
            const SizedBox(height: 12),
            Text(
              "No appointments here",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).brightness == Brightness.dark ? Colors.white24 : Colors.grey.shade400,
                fontWeight: FontWeight.w700,
              ),
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