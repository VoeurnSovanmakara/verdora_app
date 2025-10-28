import 'package:flutter/material.dart';

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
    return const Scaffold(
      body: Center(
        child: Text('Favorite Page'),
      ),
    );
  }
}
