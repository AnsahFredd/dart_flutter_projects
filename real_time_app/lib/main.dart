import 'package:flutter/material.dart';
import 'package:my_app/pages/choose_location.dart';
import 'package:my_app/pages/home.dart';
import 'package:my_app/pages/loading.dart';

void main() {
  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}