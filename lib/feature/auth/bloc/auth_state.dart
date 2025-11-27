part of 'auth_bloc.dart';

enum AuthStatus { initial, authenticated, unauthenticated }

final class AuthState {
  const AuthState._({
    required this.status,
    this.user,
  });

  const AuthState.initial() : this._(status: AuthStatus.initial);

  const AuthState.authenticated(User user)
    : this._(status: AuthStatus.authenticated, user: user);

  const AuthState.unauthenticated()
    : this._(status: AuthStatus.unauthenticated);

  final AuthStatus status;
  final User? user; // FirebaseAuth User

  bool get isLoggedIn => status == AuthStatus.authenticated;
}
