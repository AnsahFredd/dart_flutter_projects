import 'package:cliniq/core/error/exceptions/exceptions.dart';

class CacheException extends AppException {
  const CacheException({
    super.message = "Local data error. Please restart the app.",
  });
}

class TokenNotFoundException extends AppException {
  const TokenNotFoundException({
    super.message = "Session not found. Please log in again.",
  });
}

class TokenSaveFailedException extends AppException {
  const TokenSaveFailedException({
    super.message = "Failed to save session. Please try again.",
  });
}

class CacheClearFailedException extends AppException {
  const CacheClearFailedException({
    super.message = "Failed to clear local data. Please restart the app.",
  });
}

class UserDataNotFoundException extends AppException {
  const UserDataNotFoundException({
    super.message = "User data not found. Please log in again.",
  });
}

class UserDataSaveFailedException extends AppException {
  const UserDataSaveFailedException({
    super.message = "Failed to save user data. Please try again.",
  });
}