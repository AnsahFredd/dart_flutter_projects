import 'package:cliniq/features/find_doctor/data/datasources/doctor_remote_data_source.dart';
import 'package:cliniq/features/find_doctor/domain/entity/doctors.dart';
import 'package:cliniq/features/find_doctor/domain/repository/doctors.dart';

class DoctorRepositoryImpl implements DoctorsRepository {
  final DoctorRemoteDataSource remoteDataSource;

  DoctorRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Doctor>> getDoctors() {
    return remoteDataSource.getDoctors();
  }

  @override
  Future<Doctor> getDoctor(String id) {
    return remoteDataSource.getDoctor(id);
  }

  @override
  Future<List<Doctor>> searchDoctors(String query) {
    return remoteDataSource.searchDoctors(query);
  }

  @override
  Future<List<Doctor>> filterDoctors(String query) {
    return remoteDataSource.filterDoctors(query);
  }

  @override
  Future<List<Doctor>> sortDoctors(String query) {
    return remoteDataSource.sortDoctors(query);
  }

  @override
  Future<List<Doctor>> getDoctorsBySpecialty(String specialty) {
    return remoteDataSource.getDoctorsBySpecialty(specialty);
  }

  @override
  Future<List<Doctor>> getDoctorsByCity(String city) {
    return remoteDataSource.getDoctorsByCity(city);
  }

  @override
  Future<List<Doctor>> getDoctorsByState(String state) {
    return remoteDataSource.getDoctorsByState(state);
  }

  @override
  Future<List<Doctor>> getDoctorsByZipCode(String zipCode) {
    return remoteDataSource.getDoctorsByZipCode(zipCode);
  }

  @override
  Future<List<Doctor>> getDoctorsByCountry(String country) {
    return remoteDataSource.getDoctorsByCountry(country);
  }
}
