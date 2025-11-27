import 'package:flutter/material.dart';
import 'package:verdora_app/core/extensions/src/build_context_etx.dart';
import 'package:verdora_app/core/theme/colors.dart';
import 'package:verdora_app/l10n/l10n.dart';
import 'package:verdora_app/shared/widgets/src/buttons/buttons.dart';

class CheckOutButton extends StatelessWidget {
  const CheckOutButton({super.key, this.onPress});

  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;
    final textTheme = context.textTheme;
    // return BlocBuilder<CartBloc, CartState>(
    //   builder: (context, state) {
    //     final cartBloc = context.read<CartBloc>();
    //     final cartSummary = cartBloc.state.cartSummary;
    //     final totalPrice = cartSummary.totalPrice;
    //     final totalCartNumber = cartSummary.totalQuantity;
    //     if (totalCartNumber == 0) {
    //       return const SizedBox();
    //     } else {
    //       return Positioned(
    //         bottom: 16 + MediaQuery.of(context).padding.bottom / 2,
    //         left: 16,
    //         right: 16,
    //         child: CustomIconButton(
    //           onPressed: onPress ??
    //               () async {
    //                 // final isLoggedIn =
    //                 //     context.read<AuthBloc>().state.isLoggedIn;
    //                 // if (isLoggedIn) {
    //                 //   context.read<ListAddressBloc>().add(
    //                 //         AddressListFetch(
    //                 //           refresh: true,
    //                 //         ),
    //                 //       );
    //                 //   await context.pushNamed(
    //                 //     Pages.checkout.name,
    //                 //   );
    //                 // } else {
    //                 //   // redirect to [callback]
    //                 //   final redirectLoggedIn = await context.pushNamed<bool?>(
    //                 //     Pages.login.name,
    //                 //   );
    //                 //   if (redirectLoggedIn != null && context.mounted) {
    //                 //     context.read<ListAddressBloc>().add(
    //                 //           AddressListFetch(
    //                 //             refresh: true,
    //                 //           ),
    //                 //         );
    //                 //     unawaited(
    //                 //       context.pushNamed(
    //                 //         Pages.checkout.name,
    //                 //       ),
    //                 //     );
    //                 //   }
    //                 // }
    //               },
    //           children: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Container(
    //                 width: 30,
    //                 height: 30,
    //                 decoration: BoxDecoration(
    //                   color: AppColors.white,
    //                   borderRadius: BorderRadius.circular(30 / 2),
    //                 ),
    //                 child: Center(
    //                   child: Text(
    //                     totalCartNumber.toString(),
    //                     style: textTheme.bodyMedium!.copyWith(
    //                       color: colors.primary,
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               Row(
    //                 children: [
    //                   Text(l10n.checkout),
    //                   const Padding(
    //                     padding: EdgeInsets.symmetric(horizontal: 4),
    //                     child: Text('·'),
    //                   ),
    //                   Text('\$${totalPrice.toStringAsFixed(2)}'),
    //                 ],
    //               ),
    //               const Icon(
    //                 Icons.arrow_forward_ios,
    //                 size: 20,
    //                 color: AppColors.white,
    //               ),
    //             ],
    //           ),
    //         ),
    //       );
    //     }
    //   },
    // );
    return Positioned(
      bottom: 16 + MediaQuery.of(context).padding.bottom / 2,
      left: 16,
      right: 16,
      child: CustomIconButton(
        onPressed:
            onPress ??
            () async {
              // final isLoggedIn =
              //     context.read<AuthBloc>().state.isLoggedIn;
              // if (isLoggedIn) {
              //   context.read<ListAddressBloc>().add(
              //         AddressListFetch(
              //           refresh: true,
              //         ),
              //       );
              //   await context.pushNamed(
              //     Pages.checkout.name,
              //   );
              // } else {
              //   // redirect to [callback]
              //   final redirectLoggedIn = await context.pushNamed<bool?>(
              //     Pages.login.name,
              //   );

              //   if (redirectLoggedIn != null && context.mounted) {
              //     context.read<ListAddressBloc>().add(
              //           AddressListFetch(
              //             refresh: true,
              //           ),
              //         );
              //     unawaited(
              //       context.pushNamed(
              //         Pages.checkout.name,
              //       ),
              //     );
              //   }
              // }
            },
        children: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(30 / 2),
              ),
              child: Center(
                child: Text(
                  // totalCartNumber.toString(),
                  '3',
                  style: textTheme.bodyMedium?.copyWith(
                    color: colors.greenPrimary,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Text(l10n.checkout),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Text('·'),
                ),
                // Text('\$${totalPrice.toStringAsFixed(2)}'),
                const Text(r'$20.00'),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
