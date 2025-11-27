import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:verdora_app/core/app_bloc/lang/language_bloc.dart';
import 'package:verdora_app/core/common/src/constants.dart';
import 'package:verdora_app/core/enum/src/theme_status.dart';
import 'package:verdora_app/core/extensions/src/build_context_etx.dart';
import 'package:verdora_app/core/routes/src/app_router.dart';
import 'package:verdora_app/core/theme/bloc/theme_bloc.dart';
import 'package:verdora_app/core/theme/colors.dart';
import 'package:verdora_app/core/theme/spacing.dart';
import 'package:verdora_app/feature/auth/bloc/auth_bloc.dart';
import 'package:verdora_app/l10n/l10n.dart';
import 'package:verdora_app/shared/widgets/src/app_bars/app_bar.dart';
import 'package:verdora_app/shared/widgets/src/buttons/buttons.dart';
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
  void _changeLanguage(Locale locale) {
    context.read<LanguageBloc>().add(LanguageAppChange(locale: locale));
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;
    final l10n = context.l10n;
    final isDark = context.colorScheme.brightness == Brightness.dark;
    final authBloc = context.watch<AuthBloc>();
    final isLoggedIn = authBloc.state.isLoggedIn;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const MainAppBar(
        title: '',
        showBackButton: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(Spacing.m),
            child: Column(
              children: [
                if (isLoggedIn) ...[
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
                ] else ...[
                  CircleAvatar(
                    backgroundColor: colors.vIconColor,
                    radius: 40,
                    child: Icon(
                      IconsaxPlusLinear.user,
                      color: colors.greenPrimary,
                      size: 50,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    l10n.you_are_not_signed_in,
                    style: textTheme.bodyLarge?.copyWith(),
                  ),
                  CupertinoButton(
                    color: colors.transparent,
                    child: Text(
                      l10n.sign_in,
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () async {
                      await context.pushNamed(
                        Pages.login.name,
                      );
                    },
                  ),
                ],

                if (isLoggedIn) ...[
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
                          color: colors.vContainerColor,
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
                ],
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
                        color: colors.vContainerColor,
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
                            onTap: () =>
                                context.pushNamed(Pages.notification.name),
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
                            onTap: () {
                              final languageState = context
                                  .read<LanguageBloc>()
                                  .state;
                              final l10n = context.l10n;
                              unawaited(
                                CustomModal.showRoundedModal(
                                  AppRouter.rootNavigatorKey.currentContext!,
                                  (modalContext) => BlocProvider.value(
                                    value: context.read<LanguageBloc>(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                l10n.select_language,
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
                                          ListTile(
                                            leading: Text(
                                              '🇰🇭',
                                              style: textTheme.displayLarge,
                                            ),
                                            onTap: () {
                                              _changeLanguage(
                                                const Locale('km'),
                                              );
                                            },
                                            title: const Text('ភាសាខ្មែរ'),
                                            trailing:
                                                languageState.selectLanguage ==
                                                    const Locale('km')
                                                ? Icon(
                                                    Icons.check_circle,
                                                    color: colors.primary,
                                                  )
                                                : null,
                                          ),
                                          ListTile(
                                            leading: Text(
                                              '🇺🇸',
                                              style: textTheme.displayLarge,
                                            ),
                                            onTap: () {
                                              _changeLanguage(
                                                const Locale('en'),
                                              );
                                            },
                                            title: const Text('English'),
                                            trailing:
                                                languageState.selectLanguage ==
                                                    const Locale('en')
                                                ? Icon(
                                                    Icons.check_circle,
                                                    color: colors.primary,
                                                  )
                                                : null,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
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
                          BlocBuilder<ThemeBloc, ThemeState>(
                            builder: (context, state) {
                              return ListTile(
                                leading: Icon(
                                  isDark
                                      ? IconsaxPlusLinear.moon
                                      : IconsaxPlusLinear.sun_1,
                                  color: colors.neutral0,
                                ),
                                title: Text(
                                  isDark ? l10n.dark_mode : l10n.light_mode,
                                  style: textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                trailing: CupertinoSwitch(
                                  value: isDark,
                                  activeTrackColor: colors.primary,
                                  thumbColor: AppColors.white,
                                  onChanged: (value) {
                                    final newTheme = value
                                        ? ThemeColor.darkMode
                                        : ThemeColor.lightMode;
                                    context.read<ThemeBloc>().add(
                                      ThemeAppChange(theme: newTheme),
                                    );
                                  },
                                ),
                              );
                            },
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
                            onTap: () => context.pushNamed(Pages.privacy.name),
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
                            onTap: () =>
                                context.pushNamed(Pages.helpSupport.name),
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
                if (isLoggedIn)
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              CustomOutlineButton(
                                textStyle: textTheme.titleLarge?.copyWith(
                                  color: colors.vButtonColor,
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
