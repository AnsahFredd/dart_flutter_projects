import 'package:flutter/material.dart';

class Appointment {
  final String id;
  final String doctorName;
  final String speciality;
  final String image;
  final String rating;
  final String hospital;
  final AppointmentStatus status;
  final DateTime dateTime;
  final AppointmentType type;

  Appointment({
    required this.id,
    required this.doctorName,
    required this.speciality,
    required this.hospital,
    required this.image,
    required this.rating,
    required this.dateTime,
    required this.status,
    required this.type,
  });
}

enum AppointmentStatus { completed, upcoming, cancelled }

enum AppointmentType {
  inPerson,
  videoCall;

  String get label {
    switch (this) {
      case AppointmentType.inPerson:
        return "In-Person";
      case AppointmentType.videoCall:
        return "Video Call";
    }
  }

  IconData get icon {
    switch (this) {
      case AppointmentType.inPerson:
        return Icons.medical_services_outlined;
      case AppointmentType.videoCall:
        return Icons.videocam_outlined;
    }
  }
}
