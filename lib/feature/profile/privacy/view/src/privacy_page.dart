import 'package:flutter/material.dart';
import 'package:verdora_app/shared/widgets/src/app_bars/app_bar.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  static MaterialPage<void> page({Key? key}) => MaterialPage<void>(
    child: PrivacyPage(key: key),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PageAppBar(
        title: 'Privacy',
        elevation: 0,
      ),
      body: Container(),
    );
  }
}
