import 'package:cliniq/features/find_doctor/domain/entity/doctors.dart';
import 'package:cliniq/features/find_doctor/domain/repository/doctors.dart';

class FilterDoctors {
  final DoctorsRepository repository;

  FilterDoctors(this.repository);

  Future<List<Doctor>> call(String query) {
    return repository.filterDoctors(query);
  }
}
