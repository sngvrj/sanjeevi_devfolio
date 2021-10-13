import 'dart:ui';

import 'package:flutter/material.dart';

class GlassMorphism extends StatelessWidget {
  const GlassMorphism({Key? key,required this.child,required this.height,required this.width}) : super(key: key);

  final Widget? child;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 24,
                spreadRadius: 16,
                color: Colors.black.withOpacity(0.2),
              )
            ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10.0,
                  sigmaY: 10.0,
                ),
                child: Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(
                        width: 1.5,
                        color: Colors.white.withOpacity(0.2),
                      )),
                  child: child
                ),
              ),
            ),
          );
  }
}