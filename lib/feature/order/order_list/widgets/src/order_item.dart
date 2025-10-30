import 'package:flutter/cupertino.dart';
import 'package:verdora_app/core/common/src/constants.dart';
import 'package:verdora_app/core/extensions/src/build_context_etx.dart';
import 'package:verdora_app/core/theme/spacing.dart';
import 'package:verdora_app/shared/widgets/custom_image.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.all(Spacing.l),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: colors.vContainerColor,
          boxShadow: kCardShadow,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order #123456',
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  r'$85.55',
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: Spacing.xs),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '17/10/2025',
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: colors.darkShadeGrey60,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: colors.vPrimaryColor.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'DELIVERED',
                    style: textTheme.labelSmall?.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: colors.dark,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Spacing.m,
                horizontal: Spacing.xs,
              ),
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        margin: const EdgeInsets.only(right: 10),
                        child: CustomImage(
                          url:
                              'https://asset.bloomnation.com/c_fill,d_vendor:global:catalog:product:image.png,f_auto,fl_preserve_transparency,h_2000,q_auto,w_2000/v1747069803/vendor/3823/catalog/product/2/0/20240319073218_file_65f9e842a823b_65f9e8bfb5ef9.jpeg',
                          borderRadius: kBorderRadius,
                          enableCache: true,
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 15,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 6,
                          ),
                          decoration: BoxDecoration(
                            color: colors.lightShadeGrey30,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            'x1',
                            textAlign: TextAlign.center,
                            style: textTheme.bodySmall,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
