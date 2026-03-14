import 'package:cliniq/features/appointments/domain/entities/appointment.dart';

class AppointmentModel extends Appointment {
  AppointmentModel({
    required super.id,
    required super.doctorName,
    required super.speciality,
    required super.hospital,
    required super.image,
    required super.rating,
    required super.dateTime,
    required super.status,
    required super.type,
  });

  // define the fromJson format
  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json['id'],
      doctorName: json['doctor_name'],
      speciality: json['speciality'],
      hospital: json['hospital'],
      image: json['image'],
      rating: json['rating'],
      dateTime: DateTime.parse(json['date_time']),
      type: json['type'] == 'in_person'
          ? AppointmentType.inPerson
          : AppointmentType.videoCall,
      status: json['status'] == 'upcoming'
          ? AppointmentStatus.upcoming
          : json['status'] == 'completed'
          ? AppointmentStatus.completed
          : AppointmentStatus.cancelled,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "doctor_name": doctorName,
      "speciality": speciality,
      "hospital": hospital,
      "image": image,
      "rating": rating,
      "date_time": dateTime.toIso8601String(),
      "type": type == AppointmentType.inPerson ? 'in_person' : 'video_call',
      "status": status.name,
    };
  }
}
