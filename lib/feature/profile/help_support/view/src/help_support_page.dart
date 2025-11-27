import 'package:flutter/material.dart';
import 'package:verdora_app/l10n/l10n.dart';
import 'package:verdora_app/shared/widgets/src/app_bars/app_bar.dart';

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  static MaterialPage<void> page({Key? key}) => MaterialPage<void>(
    child: HelpSupportPage(key: key),
  );

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: PageAppBar(
        title: l10n.help_support,
        elevation: 0,
      ),
      body: Container(),
    );
  }
}
