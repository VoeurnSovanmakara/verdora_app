

import 'package:flutter/cupertino.dart';
import 'package:verdora_app/core/common/src/constants.dart';
import 'package:verdora_app/core/extensions/src/build_context_etx.dart';
import 'package:verdora_app/core/theme/spacing.dart';
import 'package:verdora_app/shared/widgets/custom_image.dart';

class ProductOrderItem extends StatelessWidget {
  const ProductOrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;
    
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 70,
                height: 70,
                margin: const EdgeInsets.only(
                  right: 10,
                ),
                child: CustomImage(
                  url:
                      'https://asset.bloomnation.com/c_fill,d_vendor:global:catalog:product:image.png,f_auto,fl_preserve_transparency,h_2000,q_auto,w_2000/v1747069803/vendor/3823/catalog/product/2/0/20240319073218_file_65f9e842a823b_65f9e8bfb5ef9.jpeg',
                  borderRadius: kBorderRadius,
                  enableCache: true,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rosemary Bush',
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 6,
                          ),
                          decoration: BoxDecoration(
                            color: colors.lightShadeGrey30,
                            borderRadius: BorderRadius.circular(
                              5,
                            ),
                          ),
                          child: Text(
                            'x1',
                            textAlign: TextAlign.center,
                            style: textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: Spacing.s,
                      ),
                      child: Text(
                        '“note to seller”',
                        style: textTheme.bodySmall?.copyWith(
                          color: colors.secondaryText,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: Spacing.s,
                      ),
                      child: Text(
                        r'$85.55',
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
