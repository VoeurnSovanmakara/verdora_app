part of 'splash_bloc.dart';

sealed class SplashState {}

final class SplashInitial extends SplashState {}

final class SplashStart extends SplashState {}

class SplashInitialized extends SplashState {
  SplashInitialized({required this.initialPage});

  final Pages initialPage;
}
