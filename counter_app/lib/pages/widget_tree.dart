import 'package:counter_app/data/page_notifier.dart';
import 'package:counter_app/pages/counter_page.dart';
import 'package:counter_app/pages/home_page.dart';
import 'package:counter_app/pages/settings_page.dart';
import 'package:flutter/material.dart';

List<Widget> _pages = [
  HomePage(),
  SettingsPage(),
  CounterPage(),
];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return Scaffold(
          body: _pages[selectedPage],
          bottomNavigationBar: NavigationBar(destinations: [
           NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.settings), label: "Settings"),
            NavigationDestination(icon: Icon(Icons.countertops_outlined), label: "Counter")
          ],
          selectedIndex: selectedPage,
          onDestinationSelected: (value) {
            selectedPageNotifier.value = value;
          },
          ) 
        );
      }
    );
  }
}