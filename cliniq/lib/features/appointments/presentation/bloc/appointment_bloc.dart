import 'package:cliniq/features/appointments/domain/usecases/book_new_appointment.dart';
import 'package:cliniq/features/appointments/domain/usecases/get_upcoming_appointments.dart';
import 'package:cliniq/features/appointments/domain/usecases/cancel_appointment.dart';
import 'package:cliniq/features/appointments/domain/usecases/get_appointment_details.dart';
import 'package:cliniq/features/appointments/presentation/bloc/appointment_event.dart';
import 'package:cliniq/features/appointments/presentation/bloc/appointment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  final BookNewAppointment bookNewAppointment;
  final GetUpcomingAppointments getUpcomingAppointments;
  final CancelAppointment cancelAppointment;
  final GetAppointmentDetails getAppointmentDetails;

  AppointmentBloc({
    required this.bookNewAppointment,
    required this.getUpcomingAppointments,
    required this.cancelAppointment,
    required this.getAppointmentDetails,
  }) : super(AppointmentInitial()) {
    on<BookAppointmentEvent>(_onBookAppointment);
    on<GetUpcomingAppointmentEvent>(_onGetUpcomingAppointments);
    on<CancelAppointmenEvents>(_onCancelAppointment);
    on<GetAppointmentDetailsEvent>(_onGetAppointmentDetails);
  }

  Future<void> _onBookAppointment(
    BookAppointmentEvent event,
    Emitter<AppointmentState> emit,
  ) async {
    emit(AppointmentLoading());
    try {
      await bookNewAppointment.call(event.appointment);
      emit(AppointmentBooked());
    } catch (e) {
      emit(AppointmentError(e.toString()));
    }
  }

  Future<void> _onGetUpcomingAppointments(
    GetUpcomingAppointmentEvent event,
    Emitter<AppointmentState> emit,
  ) async {
    emit(AppointmentLoading());
    try {
      final appointments = await getUpcomingAppointments.call();
      emit(UpcomingAppointmentsLoaded(appointments));
    } catch (e) {
      emit(AppointmentError(e.toString()));
    }
  }

  Future<void> _onCancelAppointment(
    CancelAppointmenEvents event,
    Emitter<AppointmentState> emit,
  ) async {
    emit(AppointmentLoading());
    try {
      await cancelAppointment.call(event.appointment);
      emit(AppointmentCancelled());
    } catch (e) {
      emit(AppointmentError(e.toString()));
    }
  }

  Future<void> _onGetAppointmentDetails(
    GetAppointmentDetailsEvent event,
    Emitter<AppointmentState> emit,
  ) async {
    emit(AppointmentLoading());
    try {
      final appointment = await getAppointmentDetails.call(event.id);
      emit(AppointmentDetailsLoaded(appointment));
    } catch (e) {
      emit(AppointmentError(e.toString()));
    }
  }
}
