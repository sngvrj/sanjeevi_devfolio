
import 'package:flutter/material.dart';
import 'package:sanjeevi_devfolio/common_widgets/drawer/drawer_controller.dart';
import 'package:sanjeevi_devfolio/themes/app_theme.dart';

import '../onHoverAnimationButton.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController _staggeredController;
  final List<Interval> _itemSlideIntervals = [];
  final CustomDrawerController _controller = CustomDrawerController();

  @override
  void initState() {
    super.initState();

    _createAnimationIntervals();

    _staggeredController = AnimationController(
      vsync: this,
      duration: _controller.animationDuration,
    )..forward();
  }

  void _createAnimationIntervals() {
    for (var i = 0; i < _controller.menuTitle.length; ++i) {
      final startTime =
          _controller.initialDelayTime + (_controller.staggerTime * i);
      final endTime = startTime + _controller.itemSlideTime;
      _itemSlideIntervals.add(
        Interval(
          startTime.inMilliseconds /
              _controller.animationDuration.inMilliseconds,
          endTime.inMilliseconds / _controller.animationDuration.inMilliseconds,
        ),
      );
    }
  }

  @override
  void dispose() {
    _staggeredController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, snapshot) {
          return Container(
            
            // color: Colors.transparent,
            child: Stack(
              fit: StackFit.expand,
              children: [
                _buildContent(),
              ],
            ),
          );
        });
  }

  Widget _buildContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // const SizedBox(height: 80),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _buildListItems(),
        ),
      ],
    );
  }

  List<Widget> _buildListItems() {
    final listItems = <Widget>[];
    for (var i = 0; i < _controller.menuTitle.length; ++i) {
      listItems.add(
        AnimatedBuilder(
          animation: _staggeredController,
          builder: (context, child) {
            final animationPercent = Curves.easeOut.transform(
              _itemSlideIntervals[i].transform(_staggeredController.value),
            );
            final opacity = animationPercent;
            final slideDistance = (1.0 - animationPercent) * 150;

            return Opacity(
              opacity: opacity,
              child: Transform.translate(
                offset: Offset(slideDistance, 0),
                child: child,
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 16),
            child: OnHoverButton(builder: (isHovered) {
              final color =
                  isHovered ? AppTheme.pinkColor : AppTheme.blackColor;
              return Text(_controller.menuTitle[i],
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 34, color: color));
            }),
          ),
        ),
      );
    }
    return listItems;
  }
}
