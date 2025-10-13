import 'package:flutter/material.dart';
import 'package:verdora_app/core/routes/routes.dart';
import 'package:verdora_app/core/theme/src/light_theme.dart';
import 'package:verdora_app/l10n/gen/app_localizations.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    final goRouter = AppRouter.router;
    return Builder(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
          },
          child: MaterialApp.router(
            theme: lightTheme,
            routerConfig: goRouter,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
          ),
        );
      },
    );
  }
}
