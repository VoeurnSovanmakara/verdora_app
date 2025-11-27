import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:verdora_app/core/extensions/src/build_context_etx.dart';
import 'package:verdora_app/core/theme/spacing.dart';
import 'package:verdora_app/l10n/l10n.dart';
import 'package:verdora_app/shared/widgets/src/form_inputs/src/custome_text_field.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  const SearchAppBar({
    required this.controller,
    super.key,
    this.bottom,
    this.height = 60,
    this.autoFocus = true,
    this.onPressCancel,
    this.onChangeText,
    this.isLoading = false,
  });
  final double height;
  final PreferredSizeWidget? bottom;
  final TextEditingController controller;
  final bool autoFocus;
  final void Function()? onPressCancel;
  final void Function(String? value)? onChangeText;
  final bool isLoading;

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _SearchAppBarState extends State<SearchAppBar> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    return AppBar(
      elevation: 0,
      leading: const SizedBox(),
      centerTitle: false,
      bottom: widget.bottom,
      leadingWidth: 0,
      shadowColor: const Color.fromRGBO(153, 153, 153, 0.3),
      title: Row(
        children: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              context.pop();
            },
            minimumSize: Size.zero,
            child: SvgPicture.asset(
              'assets/svgs/arrow_back.svg',
              colorFilter: ColorFilter.mode(
                colors.pureDark,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(width: Spacing.m),
          Flexible(
            child: CustomTextField(
              borderRadius: BorderRadius.circular(30),
              autoFocus: widget.autoFocus,
              boxConstraints: const BoxConstraints(maxHeight: 40),
              autofillHints: const [AutofillHints.addressCity],
              controller: widget.controller,
              hintText: l10n.search_products,
              maxLines: 1,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.streetAddress,
              prefixIcon: Icon(
                IconsaxPlusLinear.search_normal_1,
                size: 20,
                color: colors.darkShadeGrey60,
              ),
              onChanged: widget.onChangeText,
              suffixIcon: widget.isLoading
                  ? Container(
                      alignment: Alignment.center,
                      width: 28,
                      height: 28,
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: colors.primary,
                        ),
                      ),
                    )
                  : widget.controller.text.trim().isNotEmpty
                  ? CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: widget.onPressCancel,
                      minimumSize: Size.zero,
                      child: Visibility(
                        child: Icon(
                          Icons.cancel,
                          size: 20,
                          color: colors.neutral50,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}
