part of 'auth_bloc.dart';

sealed class AuthEvent {}

// Email + password login
class AuthLoginRequested extends AuthEvent {
  AuthLoginRequested({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}

// Google Sign-In
class AuthGoogleLoginRequested extends AuthEvent {}

// Registration
class AuthRegisterRequested extends AuthEvent {
  AuthRegisterRequested({
    required this.email,
    required this.password,
    required this.displayName,
  });

  final String email;
  final String password;
  final String displayName;
}

// Logout
class AuthLogoutRequested extends AuthEvent {}

// Check login status when app starts
class AuthCheckStatus extends AuthEvent {}
