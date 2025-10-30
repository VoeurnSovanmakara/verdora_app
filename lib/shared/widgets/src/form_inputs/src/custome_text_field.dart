import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:verdora_app/core/extensions/src/build_context_etx.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    this.borderRadius,
    super.key,
    this.onFocusChanged,
    this.controller,
    this.suffixIconConstraints,
    this.prefixIcon,
    this.hintText,
    this.onChanged,
    this.maxLines,
    this.minLines,
    this.keyboardType,
    this.inputTitle,
    this.enabled = true,
    this.readOnly = false,
    this.onTap,
    this.inputFormatters,
    this.validator,
    this.suffixIcon,
    this.onFieldSubmitted,
    this.padding = const EdgeInsets.only(bottom: 8),
    this.obscureText = false,
    this.isRequired = false,
    this.initialValue,
    this.hintTextColor,
    this.inputTitleFontSize,
    this.filledColor,
    this.textInputAction,
    this.contentPadding,
    this.autofillHints,
    this.boxConstraints,
    this.fillColors,
    this.autoFocus = false,
    this.filled = true,
  });

  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final void Function(String? value)? onChanged;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;
  final String? inputTitle;
  final double? inputTitleFontSize;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? contentPadding;
  final bool enabled;
  final bool readOnly;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final void Function({required bool isFocused})? onFocusChanged;
  final bool obscureText;
  final bool isRequired;
  final String? initialValue;
  final BoxConstraints? suffixIconConstraints;
  final Color? hintTextColor;
  final Color? filledColor;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final BorderRadius? borderRadius;
  final BoxConstraints? boxConstraints;
  final Color? fillColors;
  final bool autoFocus;
  final bool filled;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
    focusNode.addListener(_onFocusChange);
    super.initState();
  }

  @override
  void dispose() {
    focusNode.removeListener(_onFocusChange);
    super.dispose();
  }

  void _onFocusChange() {
    if (widget.onFocusChanged != null) {
      widget.onFocusChanged?.call(isFocused: focusNode.hasFocus);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final validators = <String? Function(String?)>[];

    if (widget.isRequired) {
      if (kDebugMode) {
        // print("In is required");
      }
      // validators.add(
      //   FormBuilderValidators.required(),
      // );
    }

    // Custom validator
    if (widget.validator != null) {
      validators.add((value) {
        return widget.validator?.call(value);
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.inputTitle != null && widget.inputTitle!.isNotEmpty)
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Text(
                    widget.inputTitle!,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: context.colors.neutral0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (widget.isRequired)
                    const Padding(
                      padding: EdgeInsets.only(left: 1),
                      child: Text(
                        '*',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  else
                    const SizedBox(),
                ],
              ),
            ),
          )
        else
          const SizedBox(),
        TextFormField(
          cursorColor: context.colors.neutral50,
          autofillHints: widget.autofillHints,
          controller: widget.controller,
          initialValue: widget.initialValue,
          autofocus: widget.autoFocus,
          // validator: FormBuilderValidators.compose(validators),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textInputAction: widget.textInputAction,
          onTap: widget.onTap,
          keyboardType: widget.keyboardType,
          focusNode: focusNode,
          onChanged: widget.onChanged,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          inputFormatters: widget.inputFormatters,
          obscureText: widget.obscureText,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurface,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            fillColor: widget.fillColors ?? context.colors.lightShadeGrey20,
            filled: widget.filled,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: context.colors.darkShadeGrey60),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            suffixIconConstraints: widget.suffixIconConstraints,
            contentPadding: widget.contentPadding,
            constraints:
                widget.boxConstraints ??
                const BoxConstraints(
                  maxHeight: 60,
                ),
          ),
        ),
      ],
    );
  }
}
