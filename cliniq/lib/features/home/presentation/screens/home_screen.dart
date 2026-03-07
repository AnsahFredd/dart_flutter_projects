import 'package:cliniq/features/home/presentation/widget/health_stats_section.dart';
import 'package:cliniq/features/home/presentation/widget/home_header.dart';
import 'package:cliniq/features/home/presentation/widget/quick_action_section.dart';
import 'package:cliniq/features/home/presentation/widget/steps_count_card.dart';
import 'package:cliniq/features/home/presentation/widget/upcoming_appointment_section.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.onNavigate});
  final ValueChanged<int> onNavigate;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeHeader(),
              QuickActionSection(onNavigate: widget.onNavigate),
              const SizedBox(height: 40),
              UpcomingAppointmentSection(),
              const SizedBox(height: 30,),
              HealthStatsSection(),
              const SizedBox(height: 20,),
              StepsCountCard(),
              SizedBox(height: 50,)
            ],
          ),
        ),
      ),
    );
  }
}
