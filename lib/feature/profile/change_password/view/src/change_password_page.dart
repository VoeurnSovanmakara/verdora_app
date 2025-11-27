import 'package:flutter/material.dart';
import 'package:verdora_app/core/theme/spacing.dart';
import 'package:verdora_app/shared/widgets/src/app_bars/app_bar.dart';
import 'package:verdora_app/shared/widgets/src/buttons/src/custom_button.dart';
import 'package:verdora_app/shared/widgets/src/buttons/src/transparent_button.dart';
import 'package:verdora_app/shared/widgets/src/form_inputs/src/custome_text_field.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  static MaterialPage<void> page({Key? key}) => MaterialPage<void>(
    child: ChangePasswordPage(key: key),
  );

  @override
  Widget build(BuildContext context) {
    return const ChangePasswordView();
  }
}

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PageAppBar(
        title: 'Change Password',
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Spacing.m),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: Spacing.m),
            const Text('Current Password'),
            const SizedBox(height: Spacing.s),
            CustomTextField(
              hintText: 'Enter current password',
              onChanged: (value) {},
            ),
            const SizedBox(height: Spacing.l),
            const Text('New Password'),
            const SizedBox(height: Spacing.s),
            CustomTextField(
              hintText: 'Enter new password',
              onChanged: (value) {},
            ),
            const SizedBox(height: Spacing.l),
            const Text('Confirm Password'),
            const SizedBox(height: Spacing.s),
            CustomTextField(
              hintText: 'Re-enter new password',
              onChanged: (value) {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: TransparentButton(
        children: CustomButton(
          title: 'Update Password',
          onPressed: () {},
        ),
      ),
    );
  }
}
