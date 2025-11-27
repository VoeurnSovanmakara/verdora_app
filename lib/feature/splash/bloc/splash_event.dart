part of 'splash_bloc.dart';

sealed class SplashEvent {}

class SplashInitialize extends SplashEvent {}

class SplashEnsureInitializationToken extends SplashEvent {}
