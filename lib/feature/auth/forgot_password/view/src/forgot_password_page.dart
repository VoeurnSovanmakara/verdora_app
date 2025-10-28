import 'package:flutter/material.dart';
import 'package:verdora_app/core/extensions/src/build_context_etx.dart';
import 'package:verdora_app/core/theme/spacing.dart';
import 'package:verdora_app/shared/shared.dart';
import 'package:verdora_app/shared/widgets/src/form_inputs/src/custome_text_field.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  static MaterialPage<void> page({Key? key}) => MaterialPage<void>(
    child: ForgotPasswordPage(key: key),
  );

  @override
  Widget build(BuildContext context) {
    return const ForgotPasswordView();
  }
}

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Spacing.l1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: Spacing.normal),
            Text(
              'Forgot your password?',
              textAlign: TextAlign.center,
              style: textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: Spacing.m),
            Text(
              "Enter email associated with your account and we'll send an email with instructions to reset your password.",
              style: textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.w300,
                color: colors.darkShadeGrey60
              ),
            ),
            const SizedBox(height: Spacing.l4),
            const CustomTextField(
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        ),
      ),
      bottomNavigationBar: TransparentButton(
        children: CustomButton(
          title: 'Sent Reset Link',
          onPressed: (){},
        ),
      ),
    );
  }
}
