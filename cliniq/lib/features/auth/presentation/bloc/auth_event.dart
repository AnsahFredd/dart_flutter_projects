import 'package:cliniq/features/auth/domain/entities/user.dart';

abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final User user;
  LoginEvent(this.user);
}

class RegisterEvent extends AuthEvent {
  final User user;
  RegisterEvent(this.user);
}

class LogoutEvent extends AuthEvent {}

class GetCurrentUserEvent extends AuthEvent {}
