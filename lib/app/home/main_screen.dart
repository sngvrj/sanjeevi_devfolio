import 'package:flutter/material.dart';
import 'package:sanjeevi_devfolio/animations/backGroundBubbles.dart';
import 'package:sanjeevi_devfolio/animations/background_animation.dart';
import 'package:sanjeevi_devfolio/app/home/widgets/demo_glassmorphism.dart';
import 'package:sanjeevi_devfolio/app/home/widgets/plasma_background.dart';
import 'package:sanjeevi_devfolio/themes/app_theme.dart';

import 'main_screen_content.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    print('MainScreen --> Rebuilds');
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
          // Bubbles(),
          // BackgroundBubbles(),
          // PlasmaBackground(),
          Center(
              child: GlassMorphism(
            height: size.height - 50,
            width: size.width - 150,
            child: MainScreenContent(),
          )),
        ],
      ),
    ));
  }
}
