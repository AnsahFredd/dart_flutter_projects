import 'package:cliniq/features/find_doctor/domain/entity/doctors.dart';
import 'package:cliniq/features/find_doctor/domain/repository/doctors.dart';

class GetDoctor {
  final DoctorsRepository repository;

  GetDoctor(this.repository);

  Future<Doctor> call(String id) {
    return repository.getDoctor(id);
  }
}
