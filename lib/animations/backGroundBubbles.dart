// import 'package:flutter/material.dart';
// import 'package:sanjeevi_devfolio/animations/background_animation.dart';

// class BackgroundBubbles extends StatefulWidget {
//   const BackgroundBubbles({Key? key}) : super(key: key);

//   @override
//   State<BackgroundBubbles> createState() => _BackgroundBubblesState();
// }

// class _BackgroundBubblesState extends State<BackgroundBubbles>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late List<Bubbles> bubbles;
//   final numberOfBubbles = 400;
//   final Color color = Colors.red;
//   final double maxBubblesSize = 12.0;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     bubbles = [];
//     int i = numberOfBubbles;

//     while (i > 0) {
//       bubbles.add(Bubbles(color,maxBubblesSize));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
