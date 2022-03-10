import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sanjeevi_devfolio/app/home/main_screen.dart';
import 'package:sanjeevi_devfolio/routing/route_constants.dart';

class MyRouter {
  late final router = GoRouter(
      debugLogDiagnostics: true,
      urlPathStrategy: UrlPathStrategy.path,
      routes: [
        GoRoute(
          name: RouteConstants.initial,
          path: '/',
          redirect: (state) =>
              state.namedLocation(RouteConstants.home, params: {'tab': 'home'}),
        ),
        GoRoute(
            name: RouteConstants.home,
            path: '/home/:tab(home|about|portfolio|contact)',
            pageBuilder: (context, state) {
              final tab = state.params['tab']!;
              return MaterialPage<void>(
                key: state.pageKey,
                child: MainScreen(tab: tab),
              );
            }),
// forwarding routes to remove the need to put the 'tab' param in the code
        GoRoute(
          path: '/home',
          redirect: (state) =>
              state.namedLocation(RouteConstants.home, params: {'tab': 'home'}),
        ),
        GoRoute(
          path: '/about',
          redirect: (state) => state
              .namedLocation(RouteConstants.home, params: {'tab': 'about'}),
        ),
        GoRoute(
          path: '/portfolio',
          redirect: (state) => state
              .namedLocation(RouteConstants.home, params: {'tab': 'portfolio'}),
        ),
        GoRoute(
          path: '/contact',
          redirect: (state) => state
              .namedLocation(RouteConstants.home, params: {'tab': 'contact'}),
        ),
      ]);
}
