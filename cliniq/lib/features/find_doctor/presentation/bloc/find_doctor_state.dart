import 'package:cliniq/features/find_doctor/domain/entity/doctors.dart';

abstract class FindDoctorState {}

class FindDoctorInitial extends FindDoctorState {}

class FindDoctorLoading extends FindDoctorState {}

class FindDoctorLoaded extends FindDoctorState {
  final List<Doctor> doctors;
  FindDoctorLoaded(this.doctors);
}

class FindDoctorError extends FindDoctorState {
  final String message;
  FindDoctorError(this.message);
}