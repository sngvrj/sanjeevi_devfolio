import 'package:flutter/material.dart';
import 'package:sanjeevi_devfolio/common_widgets/commonButtons.dart';
import 'package:sanjeevi_devfolio/common_widgets/onHover.dart';
import 'package:sanjeevi_devfolio/common_widgets/onHoverAnimationButton.dart';
import 'package:sanjeevi_devfolio/constants/size_constants.dart';
import 'package:sanjeevi_devfolio/constants/text_styles.dart';
import 'package:sanjeevi_devfolio/themes/app_theme.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, I\'m',
                  style: TextStyles.subHeading,
                ),
                SizedBox(height: 5),
                Text('Sanjeevi Raj',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 45,
                        letterSpacing: 1.0,
                        color: Colors.black)),
                SizedBox(height: 5),
                Text('Flutter Developer', style: TextStyles.subHeading),
                SizedBox(height: 20),
                Row(
                  children: [
                    CommonButton(
                      text: 'More About Me',
                      onPressed: () {},
                      // width: Sizes.dimen_150,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CommonButton(
                      text: 'Portfolio',
                      onPressed: () {},
                    )
                  ],
                )
              ]),
          CircleAvatar(
            radius: 200.0,
            backgroundImage: AssetImage('assets/images/profile-img.png'),
            backgroundColor: AppTheme.greyColor,
          )
        ]);
  }
}
