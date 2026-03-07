import 'package:cliniq/core/error/exceptions/exceptions.dart';

class NetworkExceptions  extends AppException{
  
   NetworkExceptions() : super(message: "No internet connection.");
}

class TimeotException extends AppException {
  const TimeotException() : super(message: "Request time out. Please try again");
}

class ConnectionException extends AppException {
  const ConnectionException() : super(message: "Unable to connect. Please try again");
}