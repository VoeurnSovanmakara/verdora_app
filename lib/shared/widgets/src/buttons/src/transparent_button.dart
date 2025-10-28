import 'package:flutter/material.dart';
import 'package:verdora_app/core/extensions/src/build_context_etx.dart';

class TransparentButton extends StatelessWidget {
  const TransparentButton({required this.children, super.key});

  final Widget children;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 16 + MediaQuery.of(context).padding.bottom / 2,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.colors.transparent,
            context.colors.white,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: children,
    );
  }
}
