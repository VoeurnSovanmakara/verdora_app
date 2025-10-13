import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:verdora_app/core/routes/src/app_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static MaterialPage<void> page({Key? key}) => MaterialPage<void>(
    child: SplashPage(key: key),
  );

  @override
  Widget build(BuildContext context) {
    return const SplashView();
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.goNamed(Pages.app.name);
    });
    super.initState();
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
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
