import 'package:cliniq/features/home/presentation/widget/blood_pressure_card.dart';
import 'package:cliniq/features/home/presentation/widget/health_rate_card.dart';
import 'package:flutter/material.dart';

class HealthStatsSection extends StatelessWidget {
  const HealthStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Heath Statistics", style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 7,),
          Row(
            children: [
              Expanded(child: IntrinsicHeight(child: HealthRateCard())),
              const SizedBox(width: 12),
              Expanded(child: IntrinsicHeight(child: BloodPressureCard())),
            ],
          ),
        ],
      ),
    );
  }
}
