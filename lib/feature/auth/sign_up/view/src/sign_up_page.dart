import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:verdora_app/core/extensions/src/build_context_etx.dart';
import 'package:verdora_app/core/routes/src/app_router.dart';
import 'package:verdora_app/core/theme/spacing.dart';
import 'package:verdora_app/shared/widgets/src/buttons/src/custom_button.dart';
import 'package:verdora_app/shared/widgets/src/form_inputs/src/custome_text_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static MaterialPage<void> page({Key? key}) => MaterialPage<void>(
    child: SignUpPage(key: key),
  );


  @override
  Widget build(BuildContext context) {
    return const SignUpView();
  }
}

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(Spacing.l1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Create your account',
                textAlign: TextAlign.center,
                style: textTheme.displayLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: Spacing.l4),
              const Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hintText: 'First name',
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(width: Spacing.normal),
                  Expanded(
                    child: CustomTextField(
                      hintText: 'Last name',
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: Spacing.normal),
              const CustomTextField(
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: Spacing.normal),
              const CustomTextField(
                hintText: 'Password',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: Spacing.normal),
              Text('Use 8 or more characters with a mix of letters, numbers & symbols',
                style: textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: colors.vDarkTextColor.withValues(alpha: 0.7)
                ),
              ),
              const SizedBox(height: Spacing.l4),
              CustomButton(
                title: 'Create account',
                onPressed: ()  {},
              ),
              const SizedBox(height: Spacing.normal),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account? ',
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: colors.vDarkTextColor.withValues(alpha: 0.7)
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () async {
                      await context.pushNamed(Pages.login.name);
                    },
                    child: Text(
                      'Log In',
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
    );
  }
}
