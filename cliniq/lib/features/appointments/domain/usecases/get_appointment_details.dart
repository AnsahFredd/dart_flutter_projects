import 'package:cliniq/features/appointments/domain/entities/appointment.dart';
import 'package:cliniq/features/appointments/domain/repositories/appointment_repository.dart';

class GetAppointmentDetails {
  final AppointmentRepository repository;

  GetAppointmentDetails(this.repository);

  Future<Appointment> call(String id) {
    return repository.getAppointmentById(id);
  }
}