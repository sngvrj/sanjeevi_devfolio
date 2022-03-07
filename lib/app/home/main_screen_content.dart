import 'package:flutter/material.dart';
import 'package:sanjeevi_devfolio/animations/animation_controller.dart';
import 'package:sanjeevi_devfolio/app/home/controllers/home_screen_content_controller.dart';
import 'package:sanjeevi_devfolio/common_widgets/drawer/drawer.dart';
import 'package:sanjeevi_devfolio/themes/app_theme.dart';

import 'home_screen.dart';

class MainScreenContent extends StatefulWidget {
  @override
  State<MainScreenContent> createState() =>
      _MainScreenContentState(Duration(milliseconds: 150));
}

class _MainScreenContentState
    extends AnimationControllerState<MainScreenContent> {
  _MainScreenContentState(Duration duration) : super(duration);

  late final Animation<double> _curvedAnimation;
  final MainScreenContentController _controller = MainScreenContentController();
  @override
  void initState() {
    super.initState();
    _curvedAnimation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildDrawer(),
        Positioned.fill(
          child: AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: ClipOval(
                                child: Material(
                                  color: AppTheme.greyColor,
                                  child: IconButton(
                                      icon: AnimatedIcon(
                                        icon: AnimatedIcons.menu_close,
                                        color: AppTheme.pinkColor,
                                        progress: _curvedAnimation,
                                        semanticLabel: 'Show menu',
                                      ),
                                      onPressed: () {
                                        _controller.expanded
                                            ? animationController.forward()
                                            : animationController.reverse();
                                        _controller.updateMenuButton();
                                      }),
                                ),
                              ),
                            )
                          ]),
                      Spacer(
                        flex: 1,
                      ),
                      _controller.expanded ? HomeScreen() : SizedBox.shrink(),
                      Spacer(),
                      Container(),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }

  Widget _buildDrawer() {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return FractionalTranslation(
          translation: Offset(1.0 - animationController.value, 0.0),
          child: _controller.expanded ? SizedBox.shrink() : CustomDrawer(),
        );
      },
    );
  }
}
