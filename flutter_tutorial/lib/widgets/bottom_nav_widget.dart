import 'package:flutter/material.dart';
import 'package:flutter_tutorial/data/notifier.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return NavigationBar(
              destinations: [
                NavigationDestination(icon: Icon(Icons.home), label: "Home"),
                NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
              ],
              selectedIndex: selectedPage,
              onDestinationSelected: (int value) {
                selectedPageNotifier.value = value;
              },
              );
      }
    );
  }
}