import 'package:basic_architecture_riverpod/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class PlasmaBackground extends StatefulWidget {
  @override
  _PlasmaBackgroundState createState() => _PlasmaBackgroundState();
}

class _PlasmaBackgroundState extends State<PlasmaBackground> {
  @override
  Widget build(BuildContext context) {
    return PlasmaRenderer(
            type: PlasmaType.bubbles,
            particles: 27,
            color: AppTheme.greyColor,
            blur: 0.16,
            size: 0.54,
            speed: 1.35,
            offset: 0,
            blendMode: BlendMode.screen,
            // particleType: ParticleType.circle,
            variation1: 0.31,
            variation2: 0.3,
            variation3: 0.13,
            rotation: 1.05,
          );
  }
}