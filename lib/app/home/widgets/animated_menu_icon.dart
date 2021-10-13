// import 'package:flutter/material.dart';

// class AnimatedMenuIcon extends StatefulWidget {


//   final 
//   @override
//   _AnimatedMenuIconState createState() => _AnimatedMenuIconState();
// }

// class _AnimatedMenuIconState extends State<AnimatedMenuIcon> {
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _controller,
//       builder: (context, snapshot) {
//         return Container(
//                         child: ClipOval(
//                           child: Material(
//                             color: Colors.black,
//                             child: IconButton(
//                                 icon: AnimatedIcon(
//                                   icon: AnimatedIcons.menu_close,
//                                   color: Colors.white,
//                                   progress: _curvedAnimation,
//                                   semanticLabel: 'Show menu',
//                                 ),
//                                 onPressed: () {
//                                   _controller.expanded
//                                       ? animationController.forward()
//                                       : animationController.reverse();
//                                   _controller.updateMenuButton();
//                                 }),
//                           ),
//                         ),
//                       );
//       }
//     );
//   }
// }
