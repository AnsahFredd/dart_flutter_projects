import 'package:cliniq/features/find_doctor/domain/entity/doctors.dart';
import 'package:cliniq/features/find_doctor/domain/repository/doctors.dart';

class SearchDoctors {
  final DoctorsRepository repository;

  SearchDoctors(this.repository);

  Future<List<Doctor>> call(String query) {
    return repository.searchDoctors(query);
  }
}
