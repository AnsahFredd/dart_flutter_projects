import 'package:cliniq/features/appointments/data/datasources/appointment_remote_data_source.dart';
import 'package:cliniq/features/appointments/domain/entities/appointment.dart';
import 'package:cliniq/features/appointments/domain/repositories/appointment_repository.dart';

class AppointmentRepositoryImpl implements AppointmentRepository {
  final AppointmentRemoteDataSource remoteDataSource;

  AppointmentRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> bookAppointment(Appointment appointment) {
    return remoteDataSource.bookAppointment(appointment);
  }

  @override
  Future<List<Appointment>> getUpcomingAppointments() {
    return remoteDataSource.getUpcomingAppointments();
  }

  @override
  Future<void> cancelAppointment(String id) {
    return remoteDataSource.cancelAppointment(id);
  }

  @override
  Future<Appointment> getAppointmentById(String id) {
    return remoteDataSource.getAppointmentById(id);
  }
}