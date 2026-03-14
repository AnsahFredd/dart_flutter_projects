import 'package:cliniq/features/find_doctor/data/models/doctors.dart';

abstract class DoctorRemoteDataSource {
  Future<List<DoctorModel>> getDoctors();
  Future<DoctorModel> getDoctor(String id);
  Future<List<DoctorModel>> searchDoctors(String query);
  Future<List<DoctorModel>> filterDoctors(String query);
  Future<List<DoctorModel>> sortDoctors(String query);
  Future<List<DoctorModel>> getDoctorsBySpecialty(String specialty);
  Future<List<DoctorModel>> getDoctorsByCity(String city);
  Future<List<DoctorModel>> getDoctorsByState(String state);
  Future<List<DoctorModel>> getDoctorsByZipCode(String zipCode);
  Future<List<DoctorModel>> getDoctorsByCountry(String country);
}
