import 'package:flutter/material.dart';
import 'package:sanjeevi_devfolio/constants/size_constants.dart';
import 'package:sanjeevi_devfolio/themes/app_theme.dart';

import 'onHover.dart';

class CommonButton extends StatefulWidget {
  const CommonButton({Key? key, required this.text, required this.onPressed,this.width})
      : super(key: key);
  final double? width;
  final String text;
  final Function() onPressed;
  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    return OnHover(builder: (isHovered) {
      final color = isHovered ? AppTheme.pinkColor : Colors.transparent;
      final borderColor =
          isHovered ? AppTheme.blackColor : AppTheme.bgWhiteColor;
      final textColor = isHovered ? AppTheme.bgWhiteColor : AppTheme.pinkColor;
      return MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        minWidth: widget.width,
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: borderColor, width: 1, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(30)),
        onPressed: widget.onPressed,
        color: color,
        child: Text(
          widget.text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w500,
            fontSize: 17,
            letterSpacing: 0.0,
          ),
        ),
      );
    });
  }
}
