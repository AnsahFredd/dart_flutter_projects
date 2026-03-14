import 'package:cliniq/features/find_doctor/data/datasources/doctor_remote_data_source.dart';
import 'package:cliniq/features/find_doctor/data/models/doctors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorFirebaseDataSource implements DoctorRemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<DoctorModel>> getDoctors() async {
    final snapshot = await _firestore.collection('doctors').get();
    return snapshot.docs.map((doc) => DoctorModel.fromJson(doc.data())).toList();
  }

  @override
  Future<DoctorModel> getDoctor(String id) async {
    final doc = await _firestore.collection('doctors').doc(id).get();
    if (!doc.exists) throw Exception("Doctor not found");
    return DoctorModel.fromJson(doc.data()!);
  }

  @override
  Future<List<DoctorModel>> searchDoctors(String query) async {
    final snapshot = await _firestore.collection('doctors')
        .where('name', isGreaterThanOrEqualTo: query)
        .where('name', isLessThanOrEqualTo: '$query\\uf8ff')
        .get();
    return snapshot.docs.map((doc) => DoctorModel.fromJson(doc.data())).toList();
  }

  @override
  Future<List<DoctorModel>> filterDoctors(String query) async {
    // Basic implementation that falls back to getting all doctors
    return getDoctors(); 
  }

  @override
  Future<List<DoctorModel>> sortDoctors(String query) async {
    // Basic implementation that falls back to getting all doctors
    return getDoctors(); 
  }

  @override
  Future<List<DoctorModel>> getDoctorsBySpecialty(String specialty) async {
    final snapshot = await _firestore.collection('doctors')
        .where('role', isEqualTo: specialty).get();
    return snapshot.docs.map((doc) => DoctorModel.fromJson(doc.data())).toList();
  }

  @override
  Future<List<DoctorModel>> getDoctorsByCity(String city) async {
    final snapshot = await _firestore.collection('doctors')
        .where('city', isEqualTo: city).get();
    return snapshot.docs.map((doc) => DoctorModel.fromJson(doc.data())).toList();
  }

  @override
  Future<List<DoctorModel>> getDoctorsByState(String state) async {
    final snapshot = await _firestore.collection('doctors')
        .where('state', isEqualTo: state).get();
    return snapshot.docs.map((doc) => DoctorModel.fromJson(doc.data())).toList();
  }

  @override
  Future<List<DoctorModel>> getDoctorsByZipCode(String zipCode) async {
    final snapshot = await _firestore.collection('doctors')
        .where('zipCode', isEqualTo: zipCode).get();
    return snapshot.docs.map((doc) => DoctorModel.fromJson(doc.data())).toList();
  }

  @override
  Future<List<DoctorModel>> getDoctorsByCountry(String country) async {
    final snapshot = await _firestore.collection('doctors')
        .where('country', isEqualTo: country).get();
    return snapshot.docs.map((doc) => DoctorModel.fromJson(doc.data())).toList();
  }
}
