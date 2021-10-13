import 'package:basic_architecture_riverpod/constants/languages.dart';
import 'package:basic_architecture_riverpod/locale/app_localization.dart';
import 'package:basic_architecture_riverpod/routing/routes.dart';
import 'package:basic_architecture_riverpod/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'routing/route_constants.dart';
import 'fade_page_route_builder.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: Languages.languages.map((e) => Locale(e.code)).toList(),
      localizationsDelegates: [
        //Custom App delegates
        AppLocalizations.delegate,
        // material delegates
        GlobalMaterialLocalizations.delegate,
        // Any type of Widget in Locale
        GlobalWidgetsLocalizations.delegate
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale!.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      theme: AppTheme.lightTheme,
      initialRoute: RouteConstants.initial,
      onGenerateRoute: (RouteSettings settings) {
        final routes = Routes.getRoutes(settings);
        final WidgetBuilder? builder;
        builder = routes[settings.name];
        return FadePageRouteBuilder(
          builder: builder!,
          settings: settings,
        );
      },
    );
  }
}
