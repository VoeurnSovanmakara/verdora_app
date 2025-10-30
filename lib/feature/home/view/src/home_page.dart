import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:verdora_app/core/extensions/src/build_context_etx.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static MaterialPage<void> page({Key? key}) => MaterialPage<void>(
    child: HomePage(key: key),
  );

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Verdora'),
        titleTextStyle: textTheme.displayMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: colors.dark,
        ),
        actionsPadding: const EdgeInsets.symmetric(horizontal: 12),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              IconsaxPlusLinear.search_normal_1,
              color: colors.dark,
            ),
          ),
        ],
      ),
      
    );
  }
}
