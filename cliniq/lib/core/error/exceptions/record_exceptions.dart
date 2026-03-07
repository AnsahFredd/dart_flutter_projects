import 'package:cliniq/core/error/exceptions/exceptions.dart';

class RecordNotFoundException extends AppException {
  const RecordNotFoundException({
    super.message = "Medical record not found.",
  });
}

class AccessDeniedException extends AppException {
  const AccessDeniedException({
    super.message = "You do not have access to this record.",
  });
}

class RecordUploadFailedException extends AppException {
  const RecordUploadFailedException({
    super.message = "Failed to upload record. Please try again.",
  });
}

class RecordDeleteFailedException extends AppException {
  const RecordDeleteFailedException({
    super.message = "Failed to delete record. Please try again.",
  });
}

class FileTooLargeException extends AppException {
  const FileTooLargeException({
    super.message = "File is too large. Please upload a smaller file.",
  });
}

class UnsupportedFileTypeException extends AppException {
  const UnsupportedFileTypeException({
    super.message = "File type not supported. Please upload a PDF or image.",
  });
}

class LabResultNotFoundException extends AppException {
  const LabResultNotFoundException({
    super.message = "Lab result not found.",
  });
}

class PrescriptionNotFoundException extends AppException {
  const PrescriptionNotFoundException({
    super.message = "Prescription not found.",
  });
}