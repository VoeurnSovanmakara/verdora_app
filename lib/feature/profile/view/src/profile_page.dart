import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:verdora_app/core/common/src/constants.dart';
import 'package:verdora_app/core/extensions/src/build_context_etx.dart';
import 'package:verdora_app/core/routes/src/app_router.dart';
import 'package:verdora_app/core/theme/spacing.dart';
import 'package:verdora_app/shared/widgets/src/app_bars/app_bar.dart';
import 'package:verdora_app/shared/widgets/src/buttons/src/custom_button.dart';
import 'package:verdora_app/shared/widgets/src/modals/custom_modals.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  
  static MaterialPage<void> page({Key? key}) => MaterialPage<void>(
    child: ProfilePage(key: key),
  );

  @override
  Widget build(BuildContext context) {
    return const ProfileView();
  }
}

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const MainAppBar(
        title: 'Profile',
        showBackButton: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(Spacing.m),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 55,
                  backgroundImage: NetworkImage(
                    'https://i.pinimg.com/736x/68/a7/08/68a70868f1b8a3fef0e10316da07335f.jpg',
                  ),
                ),
                const SizedBox(height: Spacing.normal),
                Text(
                  'Orewa Shinra',
                  style: textTheme.displaySmall,
                ),
                const SizedBox(height: Spacing.xs),
                Text(
                  'shinra131@gmail.com',
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: colors.darkShadeGrey60,
                  ),
                ),
                const SizedBox(height: Spacing.l4),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'My Account',
                        style: textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: Spacing.m),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: kCardShadow,
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(
                              IconsaxPlusLinear.edit_2,
                              color: colors.neutral0,
                            ),
                            onTap: () async {
                              await context.pushNamed(Pages.editProfile.name);
                            },
                            title: Text(
                              'Edit Profile',
                              style: textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios_rounded,
                            ),
                          ),
                          Divider(
                            height: 0,
                            thickness: 1,
                            color: colors.lightShadeGrey30,
                            endIndent: 12,
                            indent: 12,
                          ),
                          ListTile(
                            leading: Icon(
                              IconsaxPlusLinear.key,
                              color: colors.neutral0,
                            ),
                            onTap: () async {
                              await context.pushNamed(
                                Pages.changePassword.name,
                              );
                            },
                            title: Text(
                              'Change Password',
                              style: textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios_rounded,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Spacing.l4),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Settings',
                        style: textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: Spacing.m),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: kCardShadow,
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(
                              IconsaxPlusLinear.notification,
                              color: colors.neutral0,
                            ),
                            onTap: () {},
                            title: Text(
                              'Notifications',
                              style: textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios_rounded,
                            ),
                          ),
                          Divider(
                            height: 0,
                            thickness: 1,
                            color: colors.lightShadeGrey30,
                            endIndent: 12,
                            indent: 12,
                          ),
                          ListTile(
                            leading: Icon(
                              IconsaxPlusLinear.global,
                              color: colors.neutral0,
                            ),
                            onTap: () {},
                            title: Text(
                              'Language',
                              style: textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios_rounded,
                            ),
                          ),
                          Divider(
                            height: 0,
                            thickness: 1,
                            color: colors.lightShadeGrey30,
                            endIndent: 12,
                            indent: 12,
                          ),
                          ListTile(
                            leading: Icon(
                              IconsaxPlusLinear.moon,
                              color: colors.neutral0,
                            ),
                            onTap: () {},
                            title: Text(
                              'Dark Mode',
                              style: textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            trailing: CupertinoSwitch(
                              value: false,
                              onChanged: (value) {},
                            ),
                          ),
                          Divider(
                            height: 0,
                            thickness: 1,
                            color: colors.lightShadeGrey30,
                            endIndent: 12,
                            indent: 12,
                          ),
                          ListTile(
                            leading: Icon(
                              IconsaxPlusLinear.shield_security,
                              color: colors.neutral0,
                            ),
                            onTap: () {},
                            title: Text(
                              'Privacy',
                              style: textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios_rounded,
                            ),
                          ),
                          Divider(
                            height: 0,
                            thickness: 1,
                            color: colors.lightShadeGrey30,
                            endIndent: 12,
                            indent: 12,
                          ),
                          ListTile(
                            leading: Icon(
                              IconsaxPlusLinear.info_circle,
                              color: colors.neutral0,
                            ),
                            onTap: () {},
                            title: Text(
                              'Help & Support',
                              style: textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios_rounded,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Spacing.l4),
                CustomButton(
                  backgroundColor: Colors.red.withValues(alpha: 0.2),
                  title: 'Log Out',
                  textStyle: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                  onPressed: () async {
                    await CustomModal.showRoundedModal(
                      AppRouter.rootNavigatorKey.currentContext!,
                      (modalContext) => Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Are you sure you want to sign out?',
                                  style: textTheme.titleLarge,
                                ),
                                IconButton(
                                  onPressed: () {
                                    modalContext.pop();
                                  },
                                  icon: const Icon(Icons.close),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            CustomButton(
                              title: 'Log Out',
                              onPressed: () async {
                                modalContext.pop();
                              },
                            ),
                            const SizedBox(height: 10),
                            CustomButton(
                              backgroundColor: colors.neutral100,
                              foregroundColor: colors.neutral80,
                              textStyle: textTheme.titleLarge?.copyWith(
                                color: colors.primary,
                              ),
                              title: 'Cancel',
                              onPressed: () => modalContext.pop(),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 150),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
