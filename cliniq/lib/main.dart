import 'package:cliniq/core/routing/app_router.dart';
import 'package:cliniq/core/routing/routes.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter().generateRoute,
      initialRoute: Routes.slashScreen,
    );
  }
}