import 'package:cliniq/features/find_doctor/domain/entity/doctors.dart';
import 'package:cliniq/features/find_doctor/domain/repository/doctors.dart';

class GetDoctorsByZipCode {
  final DoctorsRepository repository;

  GetDoctorsByZipCode(this.repository);

  Future<List<Doctor>> call(String zipCode) {
    return repository.getDoctorsByZipCode(zipCode);
  }
}
