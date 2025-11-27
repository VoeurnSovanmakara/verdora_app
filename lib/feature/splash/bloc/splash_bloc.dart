import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:verdora_app/core/routes/src/app_router.dart';
import 'package:verdora_app/repositories/repository/src/auth_repository.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc({
    required AuthRepository authRepository,
    required SharedPreferences prefs,
  }) : _authRepository = authRepository,
       _prefs = prefs,
       super(SplashInitial()) {
    on<SplashEnsureInitializationToken>(_onEnsureInitializationToken);
  }

  final AuthRepository _authRepository;
  final SharedPreferences _prefs;

  Future<void> _onEnsureInitializationToken(
    SplashEnsureInitializationToken event,
    Emitter<SplashState> emit,
  ) async {
    final isFirstRun = _prefs.getBool('isFirstRun') ?? true;
    final authToken = _authRepository.getCurrentUser(); // Firebase current user

    // 👉 First time run → Onboarding
    if (isFirstRun) {
      emit(SplashInitialized(initialPage: Pages.welcome));
    }

    // 👉 Not first run → check login
    if (authToken == null) {
      emit(SplashInitialized(initialPage: Pages.login));
    } else {
      emit(SplashInitialized(initialPage: Pages.app));
    }
  }
}
