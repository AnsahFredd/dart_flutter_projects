import 'package:cliniq/core/constants/asset_paths.dart';
import 'package:cliniq/core/routing/routes.dart';
import 'package:cliniq/core/theme/app_colors.dart';
import 'package:cliniq/core/theme/app_text.dart';
import 'package:cliniq/features/splash/widget/bouncing_dots.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 Timer? _timer;
  

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(milliseconds: 3000), () {
      if (mounted) {
        handleTimer();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // cancel timer
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.secondaryGradient),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AssetPath.logo,
                  width: 120,
                  height: 120,
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("MediCare", style: AppText.displayLarge),
                    Icon(
                      Icons.monitor_heart,
                      size: 48,
                      color: AppColors.primary,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  "Your health. Our Priority.",
                  style: AppText.subtitleLarge,
                ),
              ],
            ),

            const Positioned(bottom: 60, child: BouncingDots()),
          ],
        ),
      ),
    );
  }

  void handleTimer() {
    Navigator.pushReplacementNamed(context, Routes.onboarding);
  }
}