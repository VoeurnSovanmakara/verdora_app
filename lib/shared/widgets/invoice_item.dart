import 'package:flutter/material.dart';
import 'package:verdora_app/core/extensions/src/build_context_etx.dart';
import 'package:verdora_app/core/theme/spacing.dart';

class InvoiceItem extends StatelessWidget {
  const InvoiceItem({
    required this.lable,
    required this.value,
    super.key,
    this.lableColor,
    this.valueColor,
    this.lableStyle,
    this.valueStyle,
    this.isCart = true,
  });

  final String lable;
  final String value;
  final Color? lableColor;
  final Color? valueColor;
  final TextStyle? lableStyle;
  final TextStyle? valueStyle;
  final bool isCart;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;
    return Container(
      padding: EdgeInsets.only(
        top: Spacing.m,
        left: isCart ? Spacing.m : 0,
        right: isCart ? Spacing.m : 0,
        bottom: isCart ? Spacing.s : 0,
      ),
      color: colors.vContainerColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            lable,
            style: lableStyle ??textTheme.bodyMedium?.copyWith(
                  color: lableColor,
            ),
          ),
          Text(
            value,
            style: valueStyle ?? textTheme.bodyMedium?.copyWith(
              color: valueColor ?? colors.darkShadeGrey90,
            ),
          ),
        ],
      ),
    );
  }
}
