import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:verdora_app/core/common/src/constants.dart';
import 'package:verdora_app/core/extensions/src/build_context_etx.dart';
import 'package:verdora_app/shared/widgets/custom_back_button.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    required this.title,
    super.key,
    this.bottom,
    this.height = 60,
    this.actions,
    this.showBackButton = true,
    this.shadow = false,
    this.elevation = 0.5,
    this.onLeadingPress,
    this.isCenterTitle = true,
  });
  final PreferredSizeWidget? bottom;
  final double height;
  final String title;
  final bool showBackButton;
  final bool shadow;
  final List<Widget>? actions;
  final double elevation;
  final void Function()? onLeadingPress;
  final bool isCenterTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: shadow
          ? const BoxDecoration(boxShadow: kAppBarShadow)
          : const BoxDecoration(),
      child: AppBar(
        elevation: elevation,
        // backgroundColor: context.colors.white,
        actions: actions,
        leading: showBackButton
            ?
              // CupertinoButton(
              //     padding: EdgeInsets.zero,
              //     onPressed:
              //         onLeadingPress ??
              //         () {
              //           context.pop();
              //         },
              //     minimumSize: Size.zero,
              //     child: Icon(
              //       Icons.arrow_back_ios,
              //       size: 24,
              //       color: context.colors.greenPrimary,
              //     ),
              //   )
              CustomBackButton(
                onPressed:
                    onLeadingPress ??
                    () {
                      context.pop();
                    },
              )
            : const SizedBox(),
        centerTitle: isCenterTitle,
        leadingWidth: isCenterTitle ? 56 : 0,
        automaticallyImplyLeading: false,
        bottom: bottom,
        title: Text(
          title,
          style: context.textTheme.displaySmall,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
