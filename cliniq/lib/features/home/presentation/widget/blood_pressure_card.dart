import 'package:cliniq/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BloodPressureCard extends StatelessWidget {
  const BloodPressureCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(Icons.water_drop, color: Colors.blue, size: 16),
              const SizedBox(width: 4),
              Text(
                "BLOOD\nPRESSURE",
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue,
                  letterSpacing: 0.8,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "120/80",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(width: 3),
              Padding(
                padding: EdgeInsets.only(bottom: 3),
                child: Text(
                  "mmHg",
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
                ),
              ),
            ],
          ),

          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.check_circle, color: AppColors.success,),
              const SizedBox(width: 3),
              Text(
                "Normal",
                style: TextStyle(color: AppColors.success, fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
