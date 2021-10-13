import 'package:basic_architecture_riverpod/constants/text_styles.dart';
import 'package:basic_architecture_riverpod/themes/app_theme.dart';
import 'package:flutter/material.dart';

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
                SizedBox(height: 15),
                Text('Sanjeevi Raj',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 45,
                        letterSpacing: 1.0,
                        color: Colors.black)),
                SizedBox(height: 15),
                Text('Flutter Developer', style: TextStyles.subHeading),
                SizedBox(height: 20),
                Row(
                  children: [
                    MaterialButton(
                      padding: EdgeInsets.all(10),
                      hoverElevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      onPressed: () {},
                      child: Text('PortFolio'),
                      color: AppTheme.pinkColor,
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: Text('More About Me'),
                      color: AppTheme.pinkColor,
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
