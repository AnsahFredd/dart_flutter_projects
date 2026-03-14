import 'package:cliniq/features/find_doctor/domain/entity/doctors.dart';
import 'package:cliniq/features/find_doctor/domain/repository/doctors.dart';

class GetDoctorsByCity {
  final DoctorsRepository repository;

  GetDoctorsByCity(this.repository);

  Future<List<Doctor>> call(String city) {
    return repository.getDoctorsByCity(city);
  }
}
