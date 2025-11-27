import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:verdora_app/core/common/src/constants.dart';
import 'package:verdora_app/core/extensions/src/build_context_etx.dart';
import 'package:verdora_app/core/routes/src/app_router.dart';
import 'package:verdora_app/l10n/l10n.dart';
import 'package:verdora_app/shared/widgets/custom_image.dart';
import 'package:verdora_app/shared/widgets/src/buttons/src/custom_button.dart';
import 'package:verdora_app/shared/widgets/src/buttons/src/custome_outline_button.dart';
import 'package:verdora_app/shared/widgets/src/modals/custom_modals.dart';
import 'package:verdora_app/shared/widgets/text_translate.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = context.textTheme;
    final colors = context.colors;
    final isDark = context.colorScheme.brightness == Brightness.dark;
    return Container(
      color: colors.vContainerColor,
      width: double.infinity,
      padding: kPadding / 2,
      child: Stack(
        children: [
          Row(
            children: [
              SizedBox(
                width: 80,
                child: CustomImage(
                  url:
                      'https://florastore.com/cdn/shop/files/1711701_Atmosphere_04_SQ_MJ_1800x1800.jpg?v=1755163489',
                  enableCache: true,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Monstera Deliciosa', style: textTheme.bodyLarge,),
                      const SizedBox(height: 12),
                      Text(r'$30.00', style: textTheme.labelLarge?.copyWith(
                        color: colors.vPrimaryColor,
                        fontWeight: FontWeight.w600,
                      ),),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Row(
              children: [
                Theme(
                  data: ThemeData.light(useMaterial3: true).copyWith(
                    iconButtonTheme: IconButtonThemeData(
                      style: IconButton.styleFrom(
                        iconSize: 20,
                        backgroundColor: isDark
                            ? colors.darkShadeGrey60
                            : colors.lightShadeGrey20,
                        minimumSize: const Size(10, 10),
                        foregroundColor: colors.neutral0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  child: IconButton(
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
                                    l10n.are_you_sure,
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
                              TextTranslate(
                                enText: 'This cart will be clear',
                                kmText: 'ទំនិញនេះនឹងដកចេញ',
                                style: textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 10),
                              CustomButton(
                                title: l10n.ok,
                                onPressed: () {
                                  modalContext.pop();
                                },
                              ),
                              const SizedBox(height: 10),
                              CustomOutlineButton(
                                textStyle: textTheme.titleLarge?.copyWith(
                                  color: colors.vErrorColor,
                                ),
                                title: l10n.cancel,
                                color: colors.vErrorColor,
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
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Text(
                    '1',
                    style: context.textTheme.bodyMedium,
                  ),
                ),
                Theme(
                  data: ThemeData.light(useMaterial3: true).copyWith(
                    iconButtonTheme: IconButtonThemeData(
                      style: IconButton.styleFrom(
                        iconSize: 20,
                        backgroundColor: colors.primary,
                        foregroundColor: colors.neutral100,
                        minimumSize: const Size(10, 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                              'Out of Stock',
                              style: context.textTheme.bodyLarge,
                            ),
                            backgroundColor: context.colors.neutral100,
                            duration: const Duration(seconds: 2),
                          ),
                          snackBarAnimationStyle: const AnimationStyle(
                            curve: Curves.fastOutSlowIn,
                            duration: Duration(milliseconds: 300),
                            reverseCurve: Curves.fastOutSlowIn,
                            reverseDuration: Duration(milliseconds: 300),
                          ),
                        );
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
