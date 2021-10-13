import 'package:basic_architecture_riverpod/app/home/main_screen.dart';
import 'package:basic_architecture_riverpod/routing/route_constants.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
        RouteConstants.initial: (context) => MainScreen(),
      };
}
