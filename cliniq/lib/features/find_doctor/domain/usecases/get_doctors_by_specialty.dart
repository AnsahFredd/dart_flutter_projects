import 'package:cliniq/features/find_doctor/domain/entity/doctors.dart';
import 'package:cliniq/features/find_doctor/domain/repository/doctors.dart';

class GetDoctorsBySpecialty {
  final DoctorsRepository repository;

  GetDoctorsBySpecialty(this.repository);

  Future<List<Doctor>> call(String specialty) {
    return repository.getDoctorsBySpecialty(specialty);
  }
}
