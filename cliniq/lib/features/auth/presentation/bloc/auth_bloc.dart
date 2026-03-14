import 'package:cliniq/features/auth/domain/usecases/get_current_user.dart';
import 'package:cliniq/features/auth/domain/usecases/login.dart';
import 'package:cliniq/features/auth/domain/usecases/logout.dart';
import 'package:cliniq/features/auth/domain/usecases/register.dart';
import 'package:cliniq/features/auth/presentation/bloc/auth_event.dart';
import 'package:cliniq/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Login login;
  final Register register;
  final Logout logout;
  final GetCurrentUser getCurrentUser;

  AuthBloc({
    required this.login,
    required this.register,
    required this.logout,
    required this.getCurrentUser
  }) : super(AuthInitial()) {
    on<LoginEvent>(_onLogin);
    on<RegisterEvent>(_onRegister);
    on<LogoutEvent>(_onLogout);
    on<GetCurrentUserEvent>(_onGetCurrentUser);
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await login.call(event.user);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await register.call(event.user);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await logout.call();
      emit(AuthLoggedOut());
    } catch (e) {
      emit(AuthError(e.toString())); 
    }
  }

  Future<void> _onGetCurrentUser(
    GetCurrentUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final user = await getCurrentUser.call();
      emit(AuthLoggedIn(user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}