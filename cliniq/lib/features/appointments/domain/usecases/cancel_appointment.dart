import 'package:cliniq/features/appointments/domain/entities/appointment.dart';
import 'package:cliniq/features/appointments/domain/repositories/appointment_repository.dart';

class CancelAppointment {

  final AppointmentRepository repository;
  CancelAppointment(this.repository);

  Future<void> call(Appointment appointment) {
    return repository.cancelAppointment(appointment.id);
  }
}