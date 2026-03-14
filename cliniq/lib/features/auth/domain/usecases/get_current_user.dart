import 'package:cliniq/features/auth/domain/entities/user.dart';
import 'package:cliniq/features/auth/domain/repositories/auth_repository.dart';

class GetCurrentUser {

  final AuthRepository repository;

  GetCurrentUser(this.repository);

  Future<User> call() {
    return repository.getCurrentUser();
  }
}