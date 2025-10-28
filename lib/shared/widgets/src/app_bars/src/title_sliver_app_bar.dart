import 'package:flutter/material.dart';

class TitleSliverAppBar extends StatelessWidget {
  const TitleSliverAppBar({
    required this.title,
    super.key,
    this.actions,
    this.bottom,
  });
  final String title;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 50,
      flexibleSpace: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: FlexibleSpaceBar(
                expandedTitleScale: 1.1,
                titlePadding: const EdgeInsets.only(left: 16),
                centerTitle: false,
                title: Text(
                  title,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ),
            if (actions != null)
              Transform.translate(
                offset: const Offset(0, 2),
                child: Row(
                  children: actions!,
                ),
              )
            else
              const SizedBox(),
          ],
        ),
      ),
      bottom: bottom,
    );
  }
}
