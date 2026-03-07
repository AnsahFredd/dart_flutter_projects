import 'package:cliniq/core/error/exceptions/exceptions.dart';

class ServerExceptions extends AppException{
  final int? statusCode;

  const ServerExceptions({
    this.statusCode,
     super.message = "Server error occured. Please try again later",
  });

}

class BadRequestException extends AppException {
  const BadRequestException({
     super.message = "Invalid request. Please check your input",
  });
}

class NotFoundException extends AppException {
  const NotFoundException({
     super.message = "The requested resource was not found.",
  });
}

class InternalServerException extends AppException {
  const InternalServerException() 
      : super(message: "Internal server error. Please try again later.");
}

class ServiceUnavailableException extends AppException {
  const ServiceUnavailableException() 
      : super(message: "Service is currently unavailable. Please try again later.");
}
