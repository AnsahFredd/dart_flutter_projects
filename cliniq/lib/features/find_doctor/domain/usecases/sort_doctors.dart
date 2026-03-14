import 'package:cliniq/features/find_doctor/domain/entity/doctors.dart';
import 'package:cliniq/features/find_doctor/domain/repository/doctors.dart';

class SortDoctors {
  final DoctorsRepository repository;

  SortDoctors(this.repository);

  Future<List<Doctor>> call(String query) {
    return repository.sortDoctors(query);
  }
}
