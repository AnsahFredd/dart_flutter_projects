// lib/core/errors/exceptions/appointment_exceptions.dart

import 'package:cliniq/core/error/exceptions/exceptions.dart';

class SlotUnavailableException extends AppException {
  const SlotUnavailableException({
    super.message = "This slot is no longer available. Please choose another time.",
  });
}

class AppointmentNotFoundException extends AppException {
  const AppointmentNotFoundException({
    super.message = "Appointment not found.",
  });
}

class AppointmentAlreadyBookedException extends AppException {
  const AppointmentAlreadyBookedException({
    super.message = "You already have an appointment at this time.",
  });
}

class AppointmentCancelledException extends AppException {
  const AppointmentCancelledException({
    super.message = "This appointment has already been cancelled.",
  });
}

class DoctorUnavailableException extends AppException {
  const DoctorUnavailableException({
    super.message = "This doctor is currently unavailable. Please try another doctor.",
  });
}

class BookingLimitReachedException extends AppException {
  const BookingLimitReachedException({
    super.message = "You have reached your maximum booking limit.",
  });
}

class InvalidAppointmentDateException extends AppException {
  const InvalidAppointmentDateException({
    super.message = "Invalid appointment date. Please select a valid date.",
  });
}