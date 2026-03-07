abstract class Failures {
  final String message;
  const Failures({required this.message});
}

// ─── NETWORK ─────────────────────────────────────
class NetworkFailure extends Failures {
  const NetworkFailure({
    super.message = "No internet connection. Please check your connection.",
  });
}

class TimeoutFailure extends Failures {
  const TimeoutFailure({
    super.message = "Request timed out. Please try again.",
  });
}

class ConnectionFailure extends Failures {
  const ConnectionFailure({
    super.message = "Unable to connect. Please try again.",
  });
}

// ─── SERVER ───────────────────────────────────────
class ServerFailure extends Failures {
  const ServerFailure({
    super.message = "Server error occurred. Please try again later.",
  });
}

class BadRequestFailure extends Failures {
  const BadRequestFailure({
    super.message = "Invalid request. Please check your input.",
  });
}

class NotFoundFailure extends Failures {
  const NotFoundFailure({
    super.message = "The requested resource was not found.",
  });
}

class ServiceUnavailableFailure extends Failures {
  const ServiceUnavailableFailure({
    super.message = "Service is currently unavailable. Please try again later.",
  });
}

// ─── AUTH ─────────────────────────────────────────
class AuthFailure extends Failures {
  const AuthFailure({
    super.message = "Authentication failed. Please try again.",
  });
}

class WrongCredentialsFailure extends Failures {
  const WrongCredentialsFailure({
    super.message = "Incorrect email or password.",
  });
}

class AccountNotFoundFailure extends Failures {
  const AccountNotFoundFailure({
    super.message = "Account not found. Please register.",
  });
}

class AccountSuspendedFailure extends Failures {
  const AccountSuspendedFailure({
    super.message = "Your account has been suspended. Contact support.",
  });
}

class EmailAlreadyExistsFailure extends Failures {
  const EmailAlreadyExistsFailure({
    super.message = "An account with this email already exists.",
  });
}

class SessionExpiredFailure extends Failures {
  const SessionExpiredFailure({
    super.message = "Your session has expired. Please log in again.",
  });
}

// ─── APPOINTMENT ──────────────────────────────────
class AppointmentFailure extends Failures {
  const AppointmentFailure({
    super.message = "Appointment error occurred. Please try again.",
  });
}

class SlotUnavailableFailure extends Failures {
  const SlotUnavailableFailure({
    super.message = "This slot is no longer available. Please choose another time.",
  });
}

class DoctorUnavailableFailure extends Failures {
  const DoctorUnavailableFailure({
    super.message = "This doctor is currently unavailable. Please try another doctor.",
  });
}

class AppointmentNotFoundFailure extends Failures {
  const AppointmentNotFoundFailure({
    super.message = "Appointment not found.",
  });
}

class BookingLimitReachedFailure extends Failures {
  const BookingLimitReachedFailure({
    super.message = "You have reached your maximum booking limit.",
  });
}

class InvalidAppointmentDateFailure extends Failures {
  const InvalidAppointmentDateFailure({
    super.message = "Invalid appointment date. Please select a valid date.",
  });
}

// ─── RECORDS ──────────────────────────────────────
class RecordFailure extends Failures {
  const RecordFailure({
    super.message = "Medical record error occurred. Please try again.",
  });
}

class RecordNotFoundFailure extends Failures {
  const RecordNotFoundFailure({
    super.message = "Medical record not found.",
  });
}

class AccessDeniedFailure extends Failures {
  const AccessDeniedFailure({
    super.message = "You do not have access to this record.",
  });
}

class FileTooLargeFailure extends Failures {
  const FileTooLargeFailure({
    super.message = "File is too large. Please upload a smaller file.",
  });
}

class UnsupportedFileTypeFailure extends Failures {
  const UnsupportedFileTypeFailure({
    super.message = "File type not supported. Please upload a PDF or image.",
  });
}

class LabResultNotFoundFailure extends Failures {
  const LabResultNotFoundFailure({
    super.message = "Lab result not found.",
  });
}

class PrescriptionNotFoundFailure extends Failures {
  const PrescriptionNotFoundFailure({
    super.message = "Prescription not found.",
  });
}

// ─── CACHE ────────────────────────────────────────
class CacheFailure extends Failures {
  const CacheFailure({
    super.message = "Local data error. Please restart the app.",
  });
}

class TokenNotFoundFailure extends Failures {
  const TokenNotFoundFailure({
    super.message = "Session not found. Please log in again.",
  });
}

class UserDataNotFoundFailure extends Failures {
  const UserDataNotFoundFailure({
    super.message = "User data not found. Please log in again.",
  });
}

// ─── GENERAL ──────────────────────────────────────
class GeneralFailure extends Failures {
  const GeneralFailure({
    super.message = "An unexpected error occurred. Please try again.",
  });
}

class ValidationFailure extends Failures {
  const ValidationFailure({
    super.message = "Please fill in all required fields correctly.",
  });
}

class ParseFailure extends Failures {
  const ParseFailure({
    super.message = "Failed to process data. Please try again.",
  });
}

class EmergencyFailure extends Failures {
  const EmergencyFailure({
    super.message = "Emergency alert failed. Please call emergency services directly.",
  });
}