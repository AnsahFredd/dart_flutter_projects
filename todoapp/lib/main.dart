import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/core/constants/theme_pref.dart';
import 'package:todoapp/core/theme/app_theme.dart';
import 'package:todoapp/core/theme/theme_notifier.dart';

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
    displayThemeMode();
    super.initState();
  }

    void displayThemeMode() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final bool? isDark = prefs.getBool(ThemePref.themeModeKey);
      themeMode.value = (isDark ?? false) ? ThemeMode.dark : ThemeMode.light;
  }
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeMode,
      builder: (_, mode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: mode,
          home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("To Do App"),
              actions: [
                IconButton(
                  onPressed: () async {
                   final newMode = 
                      mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
                    themeMode.value = newMode;

                    final SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.setBool(ThemePref.themeModeKey, newMode == ThemeMode.dark);
                }, icon: Icon(
                  mode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode,
                  
                  
                ))
              ],
            ),
          ),
        );
      }
    );
  }
}


class ChangeThemMode extends StatefulWidget {
  const ChangeThemMode({super.key});

  @override
  State<ChangeThemMode> createState() => _ChangeThemModeState();
}

class _ChangeThemModeState extends State<ChangeThemMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}