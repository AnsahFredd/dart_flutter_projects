import 'package:cliniq/features/find_doctor/domain/entity/doctors.dart';
import 'package:cliniq/features/find_doctor/domain/repository/doctors.dart';

class GetDoctorsByCountry {
  final DoctorsRepository repository;

  GetDoctorsByCountry(this.repository);

  Future<List<Doctor>> call(String country) {
    return repository.getDoctorsByCountry(country);
  }
}
