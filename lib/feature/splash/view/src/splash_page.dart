import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:verdora_app/core/di/locator.dart';
import 'package:verdora_app/core/extensions/src/build_context_etx.dart';
import 'package:verdora_app/feature/splash/bloc/splash_bloc.dart';
import 'package:verdora_app/repositories/repository/src/auth_repository.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static MaterialPage<void> page({Key? key}) => MaterialPage<void>(
    child: SplashPage(key: key),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(
        authRepository: context.read<AuthRepository>(),
        prefs: getIt<SharedPreferences>(),
      ),
      child: const SplashView(),
    );
  }
}

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    unawaited(init());
    super.initState();
  }

  Future<void> init() async {
    if (context.mounted) {
      context.read<SplashBloc>().add(SplashEnsureInitializationToken());
    }
  }

  @override
  void dispose() {
    Future.delayed(
      const Duration(milliseconds: 100),
      FlutterNativeSplash.remove,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashInitialized) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            context.goNamed(state.initialPage.name);
          });
        }
      },
      child: Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: context.colors.primary,
          ),
        ),
      ),
    );
  }
}
