import 'package:flutter/material.dart';
import 'package:verdora_app/core/extensions/src/build_context_etx.dart';
import 'package:verdora_app/l10n/l10n.dart';

class EmptyData extends StatefulWidget {
  const EmptyData({super.key, this.title, this.icon});
  final String? title;
  final Icon? icon;

  //Sliver version of Empty Data. Use combination with CustomScrollView or NestedScrollView.
  static Widget sliver({String? title, EdgeInsetsGeometry? padding}) {
    return SliverPadding(
      padding: padding ?? const EdgeInsets.only(top: 24),
      sliver: SliverToBoxAdapter(
        child: EmptyData(
          title: title,
        ),
      ),
    );
  }

  @override
  State<EmptyData> createState() => _EmptyDataState();
}

class _EmptyDataState extends State<EmptyData> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final title = widget.title ?? l10n.empty;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.icon ??
              Icon(
                Icons.do_not_disturb_alt_sharp,
                size: 64,
                color: context.colors.greenPrimary,
              ),
          const SizedBox(height: 10),
          Text(
            title,
            style:
                Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(
                  color: context.colors.greenPrimary,
                ),
          ),
        ],
      ),
    );
  }
}
