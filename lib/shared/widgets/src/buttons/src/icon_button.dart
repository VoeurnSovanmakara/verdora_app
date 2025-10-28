import 'package:flutter/material.dart';
import 'package:verdora_app/core/extensions/src/build_context_etx.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    required this.children,
    super.key,
    this.isLoading = false,
    this.onPressed,
    this.height,
    this.borderRadius,
    this.backgroundColor,
    this.foregroundColor,
    this.shape,
  });

  final bool isLoading;
  final double? height;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final void Function()? onPressed;
  final OutlinedBorder? shape;
  final Widget children;

  @override
  Widget build(BuildContext context) {
    final buttonHeight = height ?? 50;
    final buttonBorderRadius = borderRadius ?? 24;
    final buttonBackgroundColor =
        backgroundColor ?? context.colors.greenPrimary;
    final buttonForegroundColor = foregroundColor ?? Colors.white;

    final buttonShape = shape ??
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonBorderRadius),
        );

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonBackgroundColor,
        foregroundColor: buttonForegroundColor,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: buttonShape,
      ),
      onPressed: onPressed,
      child: SizedBox(
        height: buttonHeight,
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(buttonForegroundColor),
                ),
              )
            : children,
      ),
    );
  }
}
