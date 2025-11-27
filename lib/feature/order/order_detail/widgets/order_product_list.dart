import 'package:flutter/material.dart';
import 'package:verdora_app/core/extensions/src/build_context_etx.dart';
import 'package:verdora_app/core/theme/spacing.dart';
import 'package:verdora_app/shared/widgets/custom_image.dart';
import 'package:verdora_app/shared/widgets/product_order_item.dart';

class OrderProductList extends StatelessWidget {
  const OrderProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.normal,
        vertical: Spacing.l,
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
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: Spacing.l),
          Row(
            children: [
              const SizedBox(
                width: 32,
                height: 32,
                child: CustomImage(
                  url:
                      'https://www.tratopup.com/_next/image?url=%2Fassets%2Fmain%2Fkhqr-lg.webp&w=3840&q=75',
                  enableCache: true,
                ),
              ),
              const SizedBox(width: Spacing.m),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // l10n.online_payment,
                    'ONLINE',
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: Spacing.xs),
                  Text(
                    // orderDetailData.paymentMethod ?? 'N/A',
                    'ABA KHQR',
                    style: context.textTheme.titleSmall?.copyWith(
                      // color: colors.darkShadeGrey70,
                    ),
                  ),
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
