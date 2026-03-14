import 'package:cliniq/core/theme/app_colors.dart';
import 'package:cliniq/features/appointments/presentation/screens/appointment_page.dart';
import 'package:cliniq/features/home/presentation/screens/home_screen.dart';
import 'package:cliniq/features/medical_records/presentation/pages/reports_history_page.dart';
import 'package:cliniq/features/messages/presentation/screens/messages_screen.dart';
import 'package:cliniq/features/profile/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeScreen(
        onNavigate: (index) => setState(() {
          _currentPageIndex = index;
        }),
      ),
      const AppointmentPage(),
      const ReportsHistoryPage(),
      const MessagesScreen(),
      const ProfileScreen(),
    ];

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: screens[_currentPageIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.05),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentPageIndex,
          onTap: (index) => setState(() {
            _currentPageIndex = index;
          }),
          selectedItemColor: AppColors.secondary,
          unselectedItemColor: isDark ? Colors.white38 : const Color(0xFF9E9EAE),
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
          iconSize: 26,
          elevation: 0,
          backgroundColor: theme.colorScheme.surface,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
              activeIcon: Icon(Icons.home_rounded),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
              label: 'Appointments',
              activeIcon: Icon(Icons.calendar_month),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.description_outlined),
              label: 'Records',
              activeIcon: Icon(Icons.description),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline_rounded),
              label: 'Messages',
              activeIcon: Icon(Icons.chat_bubble_rounded),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded),
              label: 'Profile',
              activeIcon: Icon(Icons.person_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
