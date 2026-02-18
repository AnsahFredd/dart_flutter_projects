import 'package:counter_app/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.watch<CounterProvider>().value.toString(),
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(onPressed: () {
            context.read<CounterProvider>().incrementCounter();
          }, child: Icon(Icons.add)),
          SizedBox(height: 30.0),
          FloatingActionButton(onPressed: () {
            context.read<CounterProvider>().decrementCounter();
          }, child: Icon(Icons.remove)),
        ],
      ),
    );
  }
}
