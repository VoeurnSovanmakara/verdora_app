import 'package:flutter/material.dart';
import 'package:verdora_app/core/extensions/src/build_context_etx.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: colors.vButtonColor,
        radius: 25,
        child: Image.network(
          'https://icon-library.com/images/order-icon-png/order-icon-png-20.jpg',
          color: colors.white,
          width: 35,
        ),
      ),
      title: Text(
        'Order Status Updated',
        style: textTheme.labelLarge,
      ),
      subtitle: Text(
        'Your order #123456 is now preparing',
        style: textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w500,
          color: colors.darkShadeGrey60,
        ),
      ),
    );
  }
}
