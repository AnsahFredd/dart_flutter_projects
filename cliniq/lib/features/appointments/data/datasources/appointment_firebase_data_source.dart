import 'package:cliniq/features/appointments/data/datasources/appointment_remote_data_source.dart';
import 'package:cliniq/features/appointments/data/models/appointment_model.dart';
import 'package:cliniq/features/appointments/domain/entities/appointment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppointmentFirebaseDataSource implements AppointmentRemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get _userId => _auth.currentUser!.uid;

  @override
  Future<void> bookAppointment(Appointment appointment) async {
    await _firestore.collection('users').doc(_userId).collection('appointments').doc(appointment.id).set({
      'id': appointment.id,
      'doctor_name': appointment.doctorName,
      'speciality': appointment.speciality,
      'hospital': appointment.hospital,
      'image': appointment.image,
      'rating': appointment.rating,
      'date_time': appointment.dateTime.toIso8601String(),
      'type': appointment.type == AppointmentType.inPerson ? 'in_person' : 'video_call',
      'status': appointment.status.name,
    });
  }

  @override
  Future<List<AppointmentModel>> getUpcomingAppointments() async {
    final snapshot = await _firestore.collection('users').doc(_userId).collection('appointments').get();

    return snapshot.docs.map((doc) => AppointmentModel.fromJson(doc.data())).toList();
  }

  @override 
  Future<void> cancelAppointment(String id) async {
    await _firestore.collection('users').doc(_userId).collection('appointments').doc(id).update({'status': 'cancelled'});
  }

  @override 
  Future<AppointmentModel> getAppointmentById(String id) async {
    final doc = await _firestore.collection('users').doc(_userId).collection('appointments').doc(id).get();

    if (!doc.exists) throw Exception("Appointment not found");
    return AppointmentModel.fromJson(doc.data()!);
  }
}