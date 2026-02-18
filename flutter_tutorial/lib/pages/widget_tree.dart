import 'package:flutter/material.dart';
import 'package:flutter_tutorial/data/constants.dart';
import 'package:flutter_tutorial/data/notifier.dart';
import 'package:flutter_tutorial/pages/home.dart';
import 'package:flutter_tutorial/pages/profile_page.dart';
import 'package:flutter_tutorial/pages/settings.dart';
import 'package:flutter_tutorial/widgets/bottom_nav_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Widget> pages = const [Home(), ProfilePage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Flutter Appp"),
        actions: [
          IconButton(
            icon: ValueListenableBuilder(
              valueListenable: themNotifier,
              builder: (context, value, child) {
                return Icon(value ? Icons.light_mode : Icons.dark_mode);
              },
            ),
            onPressed: () async {
              themNotifier.value = !themNotifier.value;
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              await prefs.setBool(KConstants.themeModeKey, themNotifier.value);
            },
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          return pages[selectedPage];
        },
      ),
      bottomNavigationBar: BottomNavWidget(),
    );
  }
}
