import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sanjeevi_devfolio/routing/go_router.dart';
import 'package:sanjeevi_devfolio/routing/routes.dart';

import 'constants/languages.dart';
import 'locale/app_localization.dart';
import 'routing/route_constants.dart';
import 'fade_page_route_builder.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<MyRouter>(
          lazy: false,
          create: (BuildContext createContext) => MyRouter(),
        ),
      ],
      child: Builder(builder: (context) {
        final router = Provider.of<MyRouter>(context, listen: false).router;
        return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            supportedLocales:
                Languages.languages.map((e) => Locale(e.code)).toList(),
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
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate
            // theme: AppTheme.lightTheme,
            // initialRoute: RouteConstants.initial,
            // onGenerateRoute: (RouteSettings settings) {
            //   final routes = Routes.getRoutes(settings);
            //   final WidgetBuilder? builder;
            //   builder = routes[settings.name];
            //   return FadePageRouteBuilder(
            //     builder: builder!,
            //     settings: settings,
            //   );
            // },
            );
      }),
    );
  }
}
