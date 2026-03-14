import 'package:cliniq/features/appointments/domain/entities/appointment.dart';

abstract class AppointmentState {}

// default state when screen first loads
class AppointmentInitial extends AppointmentState {}

// shows when any action is in progress
// triggers a loading spinner in UI
class AppointmentLoading extends AppointmentState {}

// shows when booking succeed
// ui then shows success message
class AppointmentBooked extends AppointmentState {}


// shows cancellation successful
class AppointmentCancelled extends AppointmentState {}




// ui uses this list to display appointments
class UpcomingAppointmentsLoaded extends AppointmentState {
  final List<Appointment> appointments;
  UpcomingAppointmentsLoaded(this.appointments);
}


// dispplay single appointment details
class AppointmentDetailsLoaded extends AppointmentState {
  final Appointment appointment;
  AppointmentDetailsLoaded(this.appointment);
}


// displays error meesage to user
class AppointmentError extends AppointmentState {
  final String message;
  AppointmentError(this.message);
}



