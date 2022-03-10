import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pedantic/pedantic.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Unawawited performs async function.
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));

  // Any SingleTon Initialization Comes Here.

  runZonedGuarded(
    () => runApp(App()),
    (error, stackTrace) {
      print(error.toString());
      print(stackTrace.toString());
    },
  );
}
