import 'package:cliniq/features/find_doctor/domain/entity/doctors.dart';

abstract class DoctorsRepository {
  Future<List<Doctor>> getDoctors();
  Future<Doctor> getDoctor(String id);
  Future<List<Doctor>> searchDoctors(String query);
  Future<List<Doctor>> filterDoctors(String query);
  Future<List<Doctor>> sortDoctors(String query);
  Future<List<Doctor>> getDoctorsBySpecialty(String specialty);
  Future<List<Doctor>> getDoctorsByCity(String city);
  Future<List<Doctor>> getDoctorsByState(String state);
  Future<List<Doctor>> getDoctorsByZipCode(String zipCode);
  Future<List<Doctor>> getDoctorsByCountry(String country);
}