import 'package:flutter/material.dart';
import 'package:flutter_tutorial/widgets/container_widget.dart';
import 'package:flutter_tutorial/widgets/hero_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            HeroWidget(title: "Home"),
            ...List.generate(5, (index) {
              return ContainerWidget(title: "Basic layout", description: "This sis a basic layout");
            },)
          ],
        ),
      ),
    );
  }
}
