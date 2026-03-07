import 'package:cliniq/core/error/exceptions/exceptions.dart';

class UnknownException extends AppException {
  const UnknownException({
    super.message = "An unexpected error occurred. Please try again.",
  });
}

class ParseException extends AppException {
  const ParseException({
    super.message = "Failed to process data. Please try again.",
  });
}

class ValidationException extends AppException {
  const ValidationException({
    super.message = "Please fill in all required fields correctly.",
  });
}

class OperationFailedException extends AppException {
  const OperationFailedException({
    super.message = "Operation failed. Please try again.",
  });
}

class FeatureNotAvailableException extends AppException {
  const FeatureNotAvailableException({
    super.message = "This feature is not available yet.",
  });
}

class EmergencyFailedException extends AppException {
  const EmergencyFailedException({
    super.message = "Emergency alert failed. Please call emergency services directly.",
  });
}