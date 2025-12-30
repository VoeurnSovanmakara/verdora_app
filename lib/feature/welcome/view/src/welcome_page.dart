import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:verdora_app/core/di/locator.dart';
import 'package:verdora_app/core/extensions/src/build_context_etx.dart';
import 'package:verdora_app/core/routes/src/app_router.dart';
import 'package:verdora_app/core/theme/spacing.dart';
import 'package:verdora_app/shared/shared.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  static MaterialPage<void> page({Key? key}) => MaterialPage<void>(
    child: WelcomePage(key: key),
  );

  @override
  Widget build(BuildContext context) {
    return const WelcomeView();
  }
}

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {

  @override
  void dispose() {
    unawaited(
      getIt<SharedPreferences>().setBool(
      'isFirstRun',
      false,
      ),
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(Spacing.l1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/onboarding.png',
              ),
              const SizedBox(height: Spacing.normal),
              Text(
                'Welcome to \nVerdora',
                textAlign: TextAlign.center,
                style: textTheme.displayLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: Spacing.normal),
              Text(
                'Discover a world of plants and flowers. \ndelivered right to your doorstep. Signup or Login to start your green journey.',
                textAlign: TextAlign.center,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: colors.darkShadeGrey70,
                ),
              ),
              const SizedBox(height: Spacing.l4),
              CustomButton(
                title: 'Sign Up',
                onPressed: () async {
                  await context.pushNamed(Pages.signup.name);
                },
              ),
              const SizedBox(height: Spacing.normal),
              CustomButton(
                title: 'Log In',
                onPressed: () async {
                  await context.pushNamed(Pages.login.name);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
