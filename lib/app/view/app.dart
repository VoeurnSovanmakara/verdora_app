import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verdora_app/core/app_bloc/lang/language_bloc.dart';
import 'package:verdora_app/core/enum/src/theme_status.dart';
import 'package:verdora_app/core/routes/routes.dart';
import 'package:verdora_app/core/theme/bloc/theme_bloc.dart';
import 'package:verdora_app/core/theme/src/dark_theme.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LanguageBloc(),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: Builder(
        builder: (context) {
          final themeState = context.watch<ThemeBloc>().state;
          final languageState = context.watch<LanguageBloc>().state;
          return GestureDetector(
            onTap: () {
              WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
            },
            child: MaterialApp.router(
              theme: themeState.selectTheme == ThemeColor.darkMode
                  ? darkTheme
                  : lightTheme,
              routerConfig: goRouter,
              debugShowCheckedModeBanner: false,
              locale: languageState.selectLanguage,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
            ),
          );
        },
      ),
    );
  }
}
