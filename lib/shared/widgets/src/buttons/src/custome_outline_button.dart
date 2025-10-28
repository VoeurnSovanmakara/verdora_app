import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    required this.title,
    super.key,
    this.isLoading = false,
    this.onPressed,
    this.height,
    this.borderRadius,
    this.color,
    this.overlayColor,
    this.textStyle,
  });

  final String title;
  final bool isLoading;
  final double? height;
  final double? borderRadius;
  final Color? color;
  final Color? overlayColor;
  final void Function()? onPressed;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final buttonHeight = height ?? 45;
    final buttonBorderRadius = borderRadius ?? 12;
    final buttonColor = color ?? Theme.of(context).colorScheme.primary;

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        overlayColor: overlayColor,
        side: BorderSide(
          color: buttonColor,
        ),
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonBorderRadius),
        ),
      ),
      onPressed: onPressed,
      child: SizedBox(
        height: buttonHeight,
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  strokeWidth: 2,
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
