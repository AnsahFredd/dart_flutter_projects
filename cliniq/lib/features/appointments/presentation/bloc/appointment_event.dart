import 'package:cliniq/features/appointments/domain/entities/appointment.dart';

abstract class AppointmentEvent {

}
class BookAppointmentEvent extends AppointmentEvent {
  final Appointment appointment;
  BookAppointmentEvent(this.appointment);
}

class GetUpcomingAppointmentEvent extends AppointmentEvent {}

class CancelAppointmenEvents extends AppointmentEvent {
    final Appointment appointment;
    CancelAppointmenEvents(this.appointment);
}

class GetAppointmentDetailsEvent extends AppointmentEvent {
    final String id;
    GetAppointmentDetailsEvent(this.id);
}