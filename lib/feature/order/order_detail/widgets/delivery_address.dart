import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:verdora_app/core/extensions/src/build_context_etx.dart';
import 'package:verdora_app/core/theme/spacing.dart';
import 'package:verdora_app/l10n/l10n.dart';

class DeliveryAddress extends StatelessWidget {
  const DeliveryAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;
    final l10n = context.l10n;
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
            l10n.delivery_address,
            style: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            children: [
              Icon(
                // switch (orderDetailState
                //     .orderDetail
                //     ?.cusAddressType) {
                //   AddressType.home => IconsaxPlusBold.house,
                //   AddressType.work => IconsaxPlusBold.briefcase,
                //   AddressType.school => IconsaxPlusBold.teacher,
                //   AddressType.other => IconsaxPlusBold.map_1,
                //   null => IconsaxPlusBold.map_1,
                // },
                IconsaxPlusBold.map_1,
                color: colors.primary,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          // switch (orderDetailState
                          //     .orderDetail
                          //     ?.cusAddressType) {
                          //   AddressType.home => l10n.home_address,
                          //   AddressType.work => l10n.company,
                          //   AddressType.school => l10n.school,
                          //   AddressType.other => l10n.other,
                          //   null => l10n.other,
                          // },
                          l10n.other,
                          style: textTheme.bodyLarge,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          child: Text(
                            '·',
                            style: textTheme.displaySmall,
                          ),
                        ),
                        Text(
                          'Fun Mall',
                          style: textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      // orderDetailState
                      //         .orderDetail
                      //         ?.cusAddressDetail ??
                      //     'N/A',
                      'Fun Mall TK',
                      style: textTheme.bodyMedium?.copyWith(
                        color: colors.neutral50,
                        fontWeight: FontWeight.w300,
                      ),
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      maxLines: 3,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      // orderDetailState.orderDetail!.cusPhone,
                      '+85570319125',
                      style: textTheme.bodyMedium?.copyWith(
                        color: colors.neutral50,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
