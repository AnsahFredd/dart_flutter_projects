import 'package:cliniq/features/home/presentation/widget/upcoming_appotinment_card.dart';
import 'package:flutter/material.dart';

class UpcomingAppointmentSection extends StatelessWidget {
  const UpcomingAppointmentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
            children: [
              Text("Upcoming", style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              TextButton(onPressed: () {}, child: Text("View all", style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),))
            ],
          ),
          const SizedBox(height: 8,),
          UpcomingAppotinmentCard(),
        ],
      ),
    );
  }
}