import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:verdora_app/core/extensions/src/build_context_etx.dart';
import 'package:verdora_app/core/routes/src/app_router.dart';
import 'package:verdora_app/core/theme/spacing.dart';
import 'package:verdora_app/core/utils/src/app_validate.dart';
import 'package:verdora_app/feature/auth/bloc/auth_bloc.dart';
import 'package:verdora_app/shared/widgets/src/app_bars/src/page_app_bar.dart';
import 'package:verdora_app/shared/widgets/src/buttons/src/custom_button.dart';
import 'package:verdora_app/shared/widgets/src/form_inputs/src/custome_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({this.callback, super.key});

  final String? callback;

  static MaterialPage<void> page({Key? key, String? callback}) =>
      MaterialPage<void>(
        child: LoginPage(
          key: key,
          callback: callback,
        ),
  );

  @override
  Widget build(BuildContext context) {
    return LoginView(
      callback: callback,
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key, this.callback});
  final String? callback;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _paswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _paswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state.status == AuthStatus.authenticated) {
          await Future<void>.delayed(const Duration(seconds: 3));
          if (context.mounted) {
            context.goNamed(Pages.app.name);
          }
        }
        if (state.status == AuthStatus.unauthenticated) {
          if (context.mounted) {
            await showCupertinoDialog<void>(
              barrierDismissible: true,
              context: context,
              builder: (context) => const AlertDialog.adaptive(
                title: Text('Fail'),
                content: Text('Login failed!'),
              ),
            );
          }
        }
      },
      listenWhen: (previous, current) => previous.status != current.status,
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Scaffold(
            appBar: PageAppBar(
              title: 'Log In',
              elevation: 0,
              showBackButton: widget.callback != Pages.welcome.name,
            ),
            body: Form(
              key: _formKey,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(Spacing.l1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextField(
                        controller: _emailController,
                        hintText: 'Email or Username',
                        keyboardType: TextInputType.emailAddress,
                        validator: AppValidators.email,
                      ),
                      const SizedBox(height: Spacing.l1),
                      CustomTextField(
                        controller: _paswordController,
                        hintText: 'Password',
                        keyboardType: TextInputType.emailAddress,
                        validator: AppValidators.password,
                      ),
                      // const SizedBox(height: Spacing.normal),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () async {
                            await context.pushNamed(
                              Pages.forgotPassword.name,
                            );
                          },
                          child: Text(
                            'Forgot Password?',
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: Spacing.l4),
                      CustomButton(
                        title: 'Log In',
                        onPressed: () {
                          context.read<AuthBloc>().add(
                            AuthLoginRequested(
                              email: _emailController.text,
                              password: _paswordController.text,
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: Spacing.normal),
                      Text(
                        'Or continue with ',
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: Spacing.normal),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          overlayColor: colors.vButtonColor.withValues(
                            alpha: 0.1,
                          ),
                          side: BorderSide(
                            color: colors.vButtonColor,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 26,
                              width: 26,
                              child: SvgPicture.asset(
                                'assets/svgs/google.svg',
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Continue With Google',
                              style: textTheme.bodyLarge?.copyWith(),
                            ),
                          ],
                        ),
                        onPressed: () {},
                      ),
                      const SizedBox(height: Spacing.normal),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              unawaited(context.pushNamed(Pages.signup.name));
                            },
                            child: Text(
                              'Signup',
                              style: textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: colors.vButtonColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
