import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  static MaterialPage<void> page({Key? key}) => MaterialPage<void>(
    child: SearchPage(key: key),
  );

  @override
  Widget build(BuildContext context) {
    return const SearchView();
  }
}

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Search Page'),
      ),
    );
  }
}
