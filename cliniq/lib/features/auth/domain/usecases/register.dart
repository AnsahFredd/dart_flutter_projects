
import 'package:cliniq/features/auth/domain/entities/user.dart';
import 'package:cliniq/features/auth/domain/repositories/auth_repository.dart';

class Register {
  final AuthRepository repository;

  Register(this.repository);

  Future<void> call(User user) {
    return repository.register(user);
  }
}