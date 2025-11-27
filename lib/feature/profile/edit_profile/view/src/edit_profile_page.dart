import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:verdora_app/core/extensions/src/build_context_etx.dart';
import 'package:verdora_app/core/theme/spacing.dart';
import 'package:verdora_app/l10n/l10n.dart';
import 'package:verdora_app/shared/widgets/custom_image.dart';
import 'package:verdora_app/shared/widgets/src/app_bars/app_bar.dart';
import 'package:verdora_app/shared/widgets/src/form_inputs/src/custome_text_field.dart';
import 'package:verdora_app/shared/widgets/src/modals/custom_modals.dart';
import 'package:verdora_app/shared/widgets/widget.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  static MaterialPage<void> page({Key? key}) => MaterialPage<void>(
    child: EditProfilePage(key: key),
  );

  @override
  Widget build(BuildContext context) {
    return const EditProfileView();
  }
}

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;
    final l10n = context.l10n;
    return Scaffold(
      appBar: const PageAppBar(
        title: 'Edit Profile', 
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Spacing.m),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 100,
                width: 100,
                child: Stack(
                  clipBehavior: Clip.none,
                  fit: StackFit.expand,
                  children: [
                    CircleAvatar(
                      backgroundColor: colors.neutral90,
                      radius: 50,
                      child: const ClipOval(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: CustomImage(
                            url:
                                'https://i.pinimg.com/736x/68/a7/08/68a70868f1b8a3fef0e10316da07335f.jpg',
                            enableCache: true,
                          )
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: -25,
                      child: RawMaterialButton(
                        onPressed: () async {
                          await CustomModal.showRoundedModal(
                            context,
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
                                        l10n.edit_profile_picture,
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
                                    leading: Icon(
                                      IconsaxPlusLinear.camera,
                                      color: colors.neutral0,
                                    ),
                                    onTap: () {
                                      // _takePhoto();
                                      context.pop();
                                    },
                                    title: Text(l10n.take_photo),
                                  ),
                                  ListTile(
                                    leading: Icon(
                                      IconsaxPlusLinear.gallery_add,
                                      color: colors.neutral0,
                                    ),
                                    onTap: () {
                                      // _getImageFromGallery();
                                      context.pop();
                                    },
                                    title: Text(
                                      l10n.choose_from_library,
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.viewPaddingOf(
                                      context,
                                    ).bottom,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        fillColor: colors.white,
                        padding: const EdgeInsets.all(3),
                        shape: const CircleBorder(),
                        child: Icon(
                          IconsaxPlusLinear.edit_2,
                          color: colors.greenPrimary,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: Spacing.l4),
            const Text('Name'),
            const SizedBox(height: Spacing.s),
            CustomTextField(
              hintText: 'username',
              onChanged: (value) {},
            ),
            const SizedBox(height: Spacing.l),
            const Text('Email'),
            const SizedBox(height: Spacing.s),
            CustomTextField(
              hintText: 'Jessica@gmail.com',
              onChanged: (value) {},
            ),
            const SizedBox(height: Spacing.l),
            const Text('Phone Number'),
            const SizedBox(height: Spacing.s),
            CustomTextField(
              hintText: '0123456789',
              onChanged: (value) {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: TransparentButton(
        children: CustomButton(
          title: 'Save Changes',
          onPressed: () {},
        ),
      )
    );
  }
}
