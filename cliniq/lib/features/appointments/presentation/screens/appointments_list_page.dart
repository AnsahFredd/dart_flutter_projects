import 'package:flutter/material.dart';

class AppointmentsListPage extends StatelessWidget {
  const AppointmentsListPage({
    super.key,
    required this.doctorName,
    required this.speciality,
    required this.hospital,
    required this.image,
    required this.rating,
  });

  final String doctorName;
  final String speciality;
  final String hospital;
  final String image;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(doctorName),
      ),
      body: Center(child: Text("Appointments $doctorName")));
  }
}
