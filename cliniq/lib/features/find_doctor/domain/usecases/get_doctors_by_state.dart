import 'package:cliniq/features/find_doctor/domain/entity/doctors.dart';
import 'package:cliniq/features/find_doctor/domain/repository/doctors.dart';

class GetDoctorsByState {
  final DoctorsRepository repository;

  GetDoctorsByState(this.repository);

  Future<List<Doctor>> call(String state) {
    return repository.getDoctorsByState(state);
  }
}
