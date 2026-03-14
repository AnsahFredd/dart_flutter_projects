import 'package:cliniq/features/home/presentation/widget/upcoming_appointment_card.dart';
import 'package:cliniq/shared/widget/section_header.dart';
import 'package:flutter/material.dart';

class UpcomingAppointmentSection extends StatelessWidget {
  const UpcomingAppointmentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: "Upcoming",
          onActionPressed: () {},
        ),
        const UpcomingAppointmentCard(),
      ],
    );
  }
}