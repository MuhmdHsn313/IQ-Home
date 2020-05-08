import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xff55AA88);
  static const Color highlightColor = Color(0xff88BBAA);
  static const Color textColor = Color(0xff292929);
  static const Color backgroundColor = Color(0xffF5F5F5);
  static const Color articleBackgroundColor = Color(0xff8D8D8D);
  static const Color unselectedColor = Color(0xff727272);

  static ThemeData lightTheme = new ThemeData(
    primaryColor: primaryColor,
    highlightColor: highlightColor,
    fontFamily: 'Tajawal',
    canvasColor: backgroundColor,
    backgroundColor: backgroundColor,
    indicatorColor: primaryColor,
    accentColor: highlightColor,
    disabledColor: unselectedColor,
  );
}
