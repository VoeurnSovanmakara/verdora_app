import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:verdora_app/core/extensions/src/build_context_etx.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    this.color,
    this.size,
    this.isCirlce = false,
    this.onPressed,
    this.icon,
    this.isShaow = false,
  });
  
  final Color? color;
  final double? size;
  final bool isCirlce;
  final Widget? icon;
  final bool isShaow;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      minimumSize: Size.zero,
      padding: EdgeInsets.zero,
      pressedOpacity: .6,
      onPressed: onPressed ?? context.pop,
      child: Container(
        height: 36,
        width: 36,
        decoration: isCirlce
            ? BoxDecoration(
                shape: BoxShape.circle,
                color: context.colors.pureWhite,
                boxShadow: isShaow
                    ? [
                        BoxShadow(
                          color: context.colors.pureDark.withValues(alpha:0.2),
                          blurRadius: 0.5,
                          spreadRadius: 0.5,
                          offset: const Offset(0, 1),
                        ),
                      ]
                    : [],
              )
            : null,
        child: Align(
          child: icon ??
              SvgPicture.asset(
                'assets/svgs/arrow_back.svg',
                colorFilter: ColorFilter.mode(
                  color ?? context.colors.pureDark,
                  BlendMode.srcIn,
                ),
              ),

        ),
      ),
    );
  }
}
