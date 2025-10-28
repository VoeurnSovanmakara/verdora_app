import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:verdora_app/core/extensions/src/build_context_etx.dart';
import 'package:verdora_app/core/routes/src/app_router.dart';
import 'package:verdora_app/core/theme/spacing.dart';
import 'package:verdora_app/shared/widgets/src/buttons/src/custom_button.dart';
import 'package:verdora_app/shared/widgets/src/form_inputs/src/custome_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static MaterialPage<void> page({Key? key}) => MaterialPage<void>(
    child: LoginPage(key: key),
  );

  @override
  Widget build(BuildContext context) {
    return const LoginView();
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(Spacing.l1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomTextField(
                hintText: 'Email or Username',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: Spacing.normal),
              const CustomTextField(
                hintText: 'Password',
                keyboardType: TextInputType.emailAddress,
              ),
              // const SizedBox(height: Spacing.normal),
              Align(
                alignment: Alignment.centerRight,
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () async {
                    await context.pushNamed(Pages.forgotPassword.name);
                  },
                  child: Text(
                    'Forgot Password?',
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: colors.vDarkTextColor.withValues(alpha: 0.7),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: Spacing.l4),
              CustomButton(
                title: 'Log In',
                onPressed: () async {
                  await context.pushNamed(Pages.signup.name);
                },
              ),

              const SizedBox(height: Spacing.normal),
              Text(
                'Or continue with ',
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w300,
                  color: colors.vDarkTextColor.withValues(alpha: 0.7),
                ),
              ),
              const SizedBox(height: Spacing.normal),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  overlayColor: colors.vAccentColor.withValues(alpha: 0.1),
                  side: BorderSide(
                    color: colors.vAccentColor,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.facebook,
                      size: 28,
                      color: colors.vAccentColor.withValues(alpha: 0.7),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Continue With Facebook',
                      style: textTheme.bodyLarge?.copyWith(
                        color: colors.vAccentColor.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
                onPressed: () {},
              ),
              const SizedBox(height: Spacing.normal),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  overlayColor: colors.vAccentColor.withValues(alpha: 0.1),
                  side: BorderSide(
                    color: colors.vAccentColor,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.telegram,
                      size: 28,
                      color: colors.vAccentColor.withValues(alpha: 0.7),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Continue With Telegram',
                      style: textTheme.bodyLarge?.copyWith(
                        color: colors.vAccentColor.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
