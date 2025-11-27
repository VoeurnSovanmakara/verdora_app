import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:verdora_app/core/extensions/src/build_context_etx.dart';
import 'package:verdora_app/core/routes/src/app_router.dart';
import 'package:verdora_app/l10n/l10n.dart';
import 'package:verdora_app/shared/widgets/src/app_bars/src/title_app_bar.dart';
import 'package:verdora_app/shared/widgets/src/buttons/buttons.dart';
import 'package:verdora_app/shared/widgets/src/modals/custom_modals.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  static MaterialPage<void> page({Key? key}) => MaterialPage<void>(
    child: CartPage(key: key),
  );

  @override
  Widget build(BuildContext context) {
    return const CartView();
  }
}

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = context.textTheme;
    final colors = context.colors;
    return Scaffold(
      appBar: MainAppBar(
        title: 'My Cart',
        showBackButton: false,
        elevation: 0,
        isCenterTitle: false,
        actions: [
          CupertinoButton(
            child: Text(
              l10n.clear,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w500,
                color: colors.vErrorColor,
              ),
            ),
            onPressed: () {
              unawaited(
                CustomModal.showRoundedModal(
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
                        Text(
                          l10n.clear_all_cart,
                          style: textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                          title: l10n.ok,
                          onPressed: () {
                            // context.read<CartBloc>().add(
                            //   CartProductClear(),
                            // );
                            modalContext.pop();
                          },
                        ),
                        const SizedBox(height: 10),
                        CustomOutlineButton(
                          textStyle: textTheme.titleLarge?.copyWith(
                            color: colors.vButtonColor,
                          ),
                          title: l10n.cancel,
                          onPressed: () => modalContext.pop(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Cart Page'),
      ),
    );
  }
}
