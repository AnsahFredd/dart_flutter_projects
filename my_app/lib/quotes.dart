import 'package:flutter/material.dart';

class QuoteCard extends StatelessWidget {
  final String quote;
  final VoidCallback delete;


  const QuoteCard({super.key, required this.quote, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Text(
                quote,
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(onPressed: delete, 
              child: Icon(
              Icons.delete,
              color: Colors.red,
            ),),
          ],
            ),
        ),
    );
  }
}