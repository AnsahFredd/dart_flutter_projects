
import 'package:cliniq/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:cliniq/features/auth/domain/entities/user.dart';
import 'package:cliniq/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override 
  Future<void> register(User user) {
    return remoteDataSource.register(user);
  }

  @override 
  Future<void> login(User user) {
    return remoteDataSource.login(user);
  }

  @override 
  Future<void> logout() {
    return remoteDataSource.logout();
  }

  @override 
  Future<User> getCurrentUser() {
    return remoteDataSource.getCurrentUser();
  }
}