import 'package:flutter/material.dart' ;
import 'package:my_app/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() {
    WorldTime instance = WorldTime(location: "Accra", flag: "ghana.png", url: '/Africa/Accra');
    instance.getTime();
  }
  @override
  void initState() {
    super.initState();
    setupWorldTime();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Loading screen"),
    );
  }
}
