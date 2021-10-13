import 'package:basic_architecture_riverpod/app/home/widgets/demo_glassmorphism.dart';
import 'package:basic_architecture_riverpod/app/home/widgets/plasma_background.dart';
import 'package:basic_architecture_riverpod/themes/app_theme.dart';

import 'package:flutter/material.dart';

import 'main_screen_content.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          AppTheme.bgPinkColor,
          AppTheme.bgWhiteColor,
          AppTheme.bgBlueColor
        ],
      )),
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          PlasmaBackground(),
          Center(
              child: GlassMorphism(
            height: size.height - 70,
            width: size.width - 150,
            child: MainScreenContent(),
          )),
        ],
      ),
    ));
  }
}
