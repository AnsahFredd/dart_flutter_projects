import 'package:cliniq/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class OnboardingPageItem extends StatelessWidget {
  const OnboardingPageItem({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(34),
              child: Image.asset(
                image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 32),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              title,
              style: AppText.displayMedium,
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            subtitle,
            style: AppText.subtitleMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}