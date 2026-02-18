import 'package:flutter/material.dart';
import 'package:flutter_tutorial/data/constants.dart';
import 'package:flutter_tutorial/data/notifier.dart';
import 'package:flutter_tutorial/pages/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    initThemeMode();
    super.initState();
  }

  void initThemeMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? repeat = prefs.getBool(KConstants.themeModeKey);
    themNotifier.value = repeat ?? false;

  }
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themNotifier,
      builder: (context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.teal,
              brightness: value ? Brightness.light : Brightness.dark,
            ),
          ),
          home: WelcomePage(),
        );
      }
    );
  }
}


