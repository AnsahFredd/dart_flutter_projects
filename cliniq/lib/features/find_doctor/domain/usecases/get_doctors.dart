import 'package:cliniq/features/find_doctor/domain/entity/doctors.dart';
import 'package:cliniq/features/find_doctor/domain/repository/doctors.dart';

class GetDoctors {
  final DoctorsRepository repository;

  GetDoctors(this.repository);

  Future<List<Doctor>> call() {
    return repository.getDoctors();
  }
}
