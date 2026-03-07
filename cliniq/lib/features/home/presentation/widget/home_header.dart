import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26, vertical: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome back", style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),),
              Text("Hello, Fred", style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),)
            ],
          ),
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(
    'https://randomuser.me/api/portraits/women/44.jpg',),
          )
        ],
      )
    );
  }
}
