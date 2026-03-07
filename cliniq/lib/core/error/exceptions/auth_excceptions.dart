// lib/core/errors/exceptions/auth_exceptions.dart

import 'package:cliniq/core/error/exceptions/exceptions.dart';

class WrongCredentialsException extends AppException {
  const WrongCredentialsException({
    super.message = "Incorrect email or password.",
  });
}

class AccountNotFoundException extends AppException {
  const AccountNotFoundException({
    super.message = "Account not found. Please register.",
  });
}

class AccountSuspendedException extends AppException {
  const AccountSuspendedException({
    super.message = "Your account has been suspended. Contact support.",
  });
}

class UnauthorisedException extends AppException {
  const UnauthorisedException({
    super.message = "Session expired. Please log in again.",
  });
}

class EmailAlreadyExistsException extends AppException {
  const EmailAlreadyExistsException({
    super.message = "An account with this email already exists.",
  });
}

class WeakPasswordException extends AppException {
  const WeakPasswordException({
    super.message = "Password is too weak. Please choose a stronger password.",
  });
}

class TokenExpiredException extends AppException {
  const TokenExpiredException({
    super.message = "Your session has expired. Please log in again.",
  });
}