import 'package:flutter/material.dart';
import 'package:sanjeevi_devfolio/animations/animation_controller.dart';
import 'package:sanjeevi_devfolio/app/about/about_screen.dart';
import 'package:sanjeevi_devfolio/app/contact/contact_screen.dart';
import 'package:sanjeevi_devfolio/app/home/controllers/home_screen_content_controller.dart';
import 'package:sanjeevi_devfolio/app/home/widgets/demo_glassmorphism.dart';
import 'package:sanjeevi_devfolio/app/home/widgets/plasma_background.dart';
import 'package:sanjeevi_devfolio/app/portfolio/portfolio_screen.dart';
import 'package:sanjeevi_devfolio/common_widgets/drawer/drawer.dart';
import 'package:sanjeevi_devfolio/themes/app_theme.dart';

import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key, required String tab})
      : index = indexFrom(tab),
        super(key: key);
  final int index;

  // @override
  // State<MainScreen> createState() =>
  //     _MainScreenState(Duration(milliseconds: 150));
  @override
  _MainScreenState createState() =>
      _MainScreenState(Duration(milliseconds: 250));
  static int indexFrom(String tab) {
    debugPrint('MAINSCREEN INDEX IS ' + tab);
    switch (tab) {
      case 'home':
        return 0;
      case 'about':
        return 1;
      case 'portfolio':
        return 2;
      case 'contact':
        return 3;
      default:
        return 0;
    }
  }
}

class _MainScreenState extends AnimationControllerState<MainScreen> {
  _MainScreenState(Duration duration) : super(duration);

  late final Animation<double> _curvedAnimation;
  final MainScreenController _controller = MainScreenController();
  @override
  void initState() {
    super.initState();
    _curvedAnimation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn));
    _controller.updateMenuButton();
    _controller.addListener(() {
      setState(() {});
    });
    print('init called');

    _controller.init(context: context, index: widget.index);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // _controller.init(context: context, index: widget.index);
    // _selectedIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    // _controller.expanded = true;
    debugPrint(_controller.selectedIndex.toString());
    // return
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
                  child: Stack(
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: ClipOval(
                                              child: Material(
                                                color: AppTheme.greyColor,
                                                child: IconButton(
                                                    icon: AnimatedIcon(
                                                      icon: AnimatedIcons
                                                          .menu_close,
                                                      color: AppTheme.pinkColor,
                                                      progress:
                                                          _curvedAnimation,
                                                      semanticLabel:
                                                          'Show menu',
                                                    ),
                                                    onPressed: () {
                                                      _controller.expanded
                                                          ? animationController
                                                              .forward()
                                                          : animationController
                                                              .reverse();
                                                      _controller
                                                          .updateMenuButton();
                                                    }),
                                              ),
                                            ),
                                          )
                                        ]),
                                    Spacer(
                                      flex: 1,
                                    ),
                                    _controller.expanded
                                        ? IndexedStack(
                                            index: widget.index,
                                            children: [
                                              HomeScreen(),
                                              AboutScreen(),
                                              PortFolioScreen(),
                                              ContactScreen()
                                            ],
                                          )
                                        : SizedBox.shrink(),
                                    Spacer(),
                                    Container(),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  ))),
        ],
      ),
    ));
  }

  Widget _buildDrawer() {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return FractionalTranslation(
          translation: Offset(1.0 - animationController.value, 0.0),
          child: _controller.expanded
              ? SizedBox.shrink()
              : CustomDrawer(
                  tabOnPressed: () {
                    debugPrint('callBackCalled');
                    _controller.expanded
                        ? animationController.forward()
                        : animationController.reverse();
                    _controller.updateMenuButton();
                  },
                ),
        );
      },
    );
  }
}
