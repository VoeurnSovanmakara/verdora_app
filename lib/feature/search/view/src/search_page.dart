import 'package:flutter/material.dart';
import 'package:verdora_app/shared/widgets/src/app_bars/src/search_app_bar.dart';

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
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(controller: _searchController),
      body: const Center(
        child: Text('Search Page'),
      ),
    );
  }
}
