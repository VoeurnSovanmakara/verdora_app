import 'package:flutter/material.dart';
import 'package:verdora_app/shared/widgets/src/app_bars/app_bar.dart';

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  static MaterialPage<void> page({Key? key}) => MaterialPage<void>(
    child: HelpSupportPage(key: key),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PageAppBar(title: 'Help & Support'),
      body: Container(),
    );
  }
}
