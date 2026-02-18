import 'package:counter_app/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(
        context.watch<UserProvider>().username,
      ),
    );
  }
}