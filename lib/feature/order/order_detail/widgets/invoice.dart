import 'package:flutter/material.dart';
import 'package:verdora_app/core/extensions/src/build_context_etx.dart';
import 'package:verdora_app/core/theme/spacing.dart';
import 'package:verdora_app/shared/widgets/invoice_item.dart';

class Invoice extends StatelessWidget {
  const Invoice({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.normal,
        vertical: Spacing.l2,
      ),
      decoration: BoxDecoration(
        color: colors.vContainerColor,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Fee Breakdown',
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const InvoiceItem(
            isCart: false,
            lable: 'Subtotal',
            value: r'$20',
          ),
          // if (invoices.total_discount > 0)
          InvoiceItem(
            isCart: false,
            lable: 'Discount',
            valueColor: colors.primary,
            value: r'$-2.00',
          ),
          InvoiceItem(
            isCart: false,
            lable: 'Delivery Fee',
            valueColor: colors.primary,
            value: r'$2.00',
          ),
          InvoiceItem(
            isCart: false,
            lable: 'Total(incl. VAT)',
            valueColor: colors.tertiary,
            valueStyle: textTheme.bodyMedium?.copyWith(
              color: colors.tertiary,
              fontWeight: FontWeight.w600,
            ),
            lableStyle: textTheme.bodyMedium?.copyWith(
              color: colors.tertiary,
              fontWeight: FontWeight.w600,
            ),
            lableColor: colors.tertiary,
            value: r'$20.00',
          ),
        ],
      ),
    );
  }
}
