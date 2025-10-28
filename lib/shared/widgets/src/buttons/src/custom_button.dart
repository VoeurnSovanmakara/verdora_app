import 'package:flutter/material.dart';
import 'package:verdora_app/core/extensions/src/build_context_etx.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.title,
    super.key,
    this.isLoading = false,
    this.onPressed,
    this.height,
    this.borderRadius,
    this.backgroundColor,
    this.foregroundColor,
    this.textStyle,
    this.shape,
  });

  final String title;
  final bool isLoading;
  final double? height;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final void Function()? onPressed;
  final TextStyle? textStyle;
  final OutlinedBorder? shape;

  @override
  Widget build(BuildContext context) {
    final buttonHeight = height ?? 50;
    final buttonBorderRadius = borderRadius ?? 12;
    final buttonBackgroundColor =
        backgroundColor ?? context.colors.vButtonColor;
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
      onPressed: isLoading ? () {} : onPressed,
      child: SizedBox(
        height: buttonHeight,
        child: Center(
          child: isLoading
              ? CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(buttonForegroundColor),
                )
              : Text(
                  title,
                  style: textStyle,
                ),
        ),
      ),
    );
  }
}
