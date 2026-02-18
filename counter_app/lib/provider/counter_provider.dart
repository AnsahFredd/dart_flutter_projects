import 'package:flutter/material.dart';

class CounterProvider  extends ChangeNotifier{
  int value;

  CounterProvider({
    this.value = 0,
  });

  void incrementCounter () {
    value++;
    notifyListeners();
  }

  void decrementCounter () {
    value--;
    notifyListeners();
  }
}