import 'package:cliniq/core/theme/app_colors.dart';
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
      // const AppointmentsListPage(),
      const ReportsHistoryPage(),
      const MessagesScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: screens[_currentPageIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentPageIndex,
          onTap: (index) => setState(() {
            _currentPageIndex = index;
          }),
          selectedItemColor: AppColors.secondary,
          unselectedItemColor: const Color(0xFF9E9EAE),
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
          iconSize: 28,
          elevation: 0,
          backgroundColor: const Color(0xFFF5F0FF),
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
