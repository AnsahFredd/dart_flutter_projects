class Appointment {

  final String id;
  final String doctorName;
  final String speciality;
  final AppointmentStatus status;
  final DateTime dateTime;
  final AppointmentType type; 


  Appointment({
    required this.id,
    required this.doctorName,
    required this.speciality,
    required this.dateTime,
    required this.status,
    required this.type,
  });
}

enum AppointmentStatus { completed, upcoming, cancelled }
enum AppointmentType { inPerson, videoCall }