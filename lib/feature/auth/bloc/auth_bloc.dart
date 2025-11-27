import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:verdora_app/repositories/repository/src/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required AuthRepository authRepo,
    required SharedPreferences prefs,
  }) : _authRepo = authRepo,
       _prefs = prefs,
       super(const AuthState.initial()) {
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthRegisterRequested>(_onRegisterRequested);
    on<AuthLogoutRequested>(_onLogoutRequested);
    on<AuthCheckStatus>(_onCheckStatus);
  }

  final AuthRepository _authRepo;
  final SharedPreferences _prefs;

  // LOGIN
  Future<void> _onLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState._(status: AuthStatus.initial));

    try {
      final user = await _authRepo.login(event.email, event.password);

      if (user != null) {
        await _prefs.setBool('isLoggedIn', true);
        emit(AuthState.authenticated(user));
      } else {
        emit(const AuthState.unauthenticated());
      }
    } catch (e) {
      emit(const AuthState.unauthenticated());
    }
  }

  // REGISTER
  Future<void> _onRegisterRequested(
    AuthRegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final user = await _authRepo.register(
        event.email,
        event.password,
        event.displayName,
      );

      if (user != null) {
        await _prefs.setBool('isLoggedIn', true);
        emit(AuthState.authenticated(user));
      } else {
        emit(const AuthState.unauthenticated());
      }
    } catch (e) {
      emit(const AuthState.unauthenticated());
    }
  }

  // LOGOUT
  Future<void> _onLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    await _authRepo.signOut();
    await _prefs.setBool('isLoggedIn', false);

    emit(const AuthState.unauthenticated());
  }

  // CHECK LOGIN STATUS (Splash screen)
  Future<void> _onCheckStatus(
    AuthCheckStatus event,
    Emitter<AuthState> emit,
  ) async {
    final isLoggedIn = _prefs.getBool('isLoggedIn') ?? false;

    if (!isLoggedIn) {
      emit(const AuthState.unauthenticated());
      return;
    }

    final user = _authRepo.getCurrentUser();

    if (user != null) {
      emit(AuthState.authenticated(user));
    } else {
      emit(const AuthState.unauthenticated());
    }
  }
}
