import 'package:cliniq/features/auth/domain/entities/user.dart';
import 'package:cliniq/features/auth/domain/repositories/auth_repository.dart';

class Login {
  final AuthRepository repository;

  Login(this.repository);

  Future<void> call(User user) {
    return repository.login(user);
  }
}