import 'package:basic_architecture_riverpod/themes/app_theme.dart';
import 'package:flutter/material.dart';

//! All the text styles used in the app
class TextStyles {
  static const taskName = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 17,
    letterSpacing: 0.0,
  );

  static final heading = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 24,
  );

  static const content = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 22,
  );

  static const caption = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );

  static final subHeading = TextStyle(
      fontWeight: FontWeight.w400, fontSize: 16, color: AppTheme.blackColor);
}
