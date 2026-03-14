import 'package:cliniq/features/home/presentation/widget/blood_pressure_card.dart';
import 'package:cliniq/features/home/presentation/widget/health_rate_card.dart';
import 'package:cliniq/shared/widget/section_header.dart';
import 'package:flutter/material.dart';

class HealthStatsSection extends StatelessWidget {
  const HealthStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: "Health Statistics",
          showAction: true,
          actionText: "Check Up",
          onActionPressed: () {},
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Expanded(child: HealthRateCard()),
              SizedBox(width: 16),
              Expanded(child: BloodPressureCard()),
            ],
          ),
        ),
      ],
    );
  }
}

