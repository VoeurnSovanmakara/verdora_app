import 'package:flutter/material.dart';
import 'package:verdora_app/core/extensions/src/build_context_etx.dart';
import 'package:verdora_app/core/theme/spacing.dart';
import 'package:verdora_app/shared/widgets/product_order_item.dart';
import 'package:verdora_app/shared/widgets/transparent_image.dart';

class OrderProductList extends StatelessWidget {
  const OrderProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.normal,
        vertical: Spacing.l2,
      ),
      decoration: BoxDecoration(
        color: colors.vContainerColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ordered Summary',
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: Spacing.l),
          Row(
            children: [
              const SizedBox(
                width: 32,
                height: 32,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  child: TransparentImage(
                    url:
                        'https://static.thenounproject.com/png/cash-delivery-icon-890892-512.png',
                    enableCache: true,
                  ),
                ),
              ),
              const SizedBox(width: Spacing.m),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // l10n.online_payment,
                    'Cash on Delivery',
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // const SizedBox(height: Spacing.xs),
                  // Text(
                  //   // orderDetailData.paymentMethod ?? 'N/A',
                  //   'Credit Card',
                  //   style: textTheme.titleSmall?.copyWith(
                  //     color: colors.darkShadeGrey70,
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
          const SizedBox(height: Spacing.l2),
          ListView.separated(
            separatorBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: Spacing.l,
                ),
                child: Divider(
                  thickness: 1.1,
                  height: 0,
                  color: colors.lightShadeGrey20,
                ),
              );
            },
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (context, index) {
              return const ProductOrderItem();
            },
          ),
        ],
      ),
    );
  }
}
