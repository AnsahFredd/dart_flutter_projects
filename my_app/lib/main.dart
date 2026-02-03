
import 'package:flutter/material.dart';
import 'package:my_app/add_quote.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quotes App'),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: AddQuote(),
      ),
    );
    }
    }