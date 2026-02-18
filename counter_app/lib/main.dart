import 'package:counter_app/pages/widget_tree.dart';
import 'package:counter_app/provider/counter_provider.dart';
import 'package:counter_app/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CounterProvider(),),
        ChangeNotifierProvider(create: (context) => UserProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Welcome back", style: TextStyle(color:  Colors.white, fontSize: 24.0),),
            centerTitle: true,
            backgroundColor: Colors.teal,
          ),
          body: WidgetTree(),
        ),
      ),
    );
  }
}