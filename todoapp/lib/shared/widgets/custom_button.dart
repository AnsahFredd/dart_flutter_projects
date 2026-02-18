import 'package:flutter/material.dart';
import 'package:todoapp/core/theme/button_scheme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, required this.onPressed, required this.style});

  final String title;
  final VoidCallback onPressed;
  final String style;
  

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: AppButtonTheme.elevatedButtonTheme.style,
      onPressed: onPressed,
      child: Text(title),
    );
  }
}