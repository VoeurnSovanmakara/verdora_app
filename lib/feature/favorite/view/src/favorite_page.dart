import 'package:flutter/material.dart';
import 'package:verdora_app/l10n/l10n.dart';
import 'package:verdora_app/shared/widgets/src/app_bars/app_bar.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  static MaterialPage<void> page({Key? key}) => MaterialPage<void>(
    child: FavoritePage(key: key),
  );

  @override
  Widget build(BuildContext context) {
    return const FavoriteView();
  }
}

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: PageAppBar(
        title: l10n.favorite,
      ),
      body: const Center(
        child: Text('Favorite Page'),
      ),
    );
  }
}
