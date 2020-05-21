import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xff55AA88);
  static const Color highlightColor = Color(0xff88BBAA);
  static const Color textColor1 = Color(0xffB4B4B4);
  static const Color textColor2 = Color(0xff727272);
  static const Color backgroundColor = Color(0xffF5F5F5);
  static const Color cardColor = Colors.white;
  static const Color articleBackgroundColor = Color(0xff8D8D8D);
  static const Color disabledColor = Color(0xff727272);
  static const Color unselectedColor = Color(0xffDADADA);

  static ThemeData lightTheme = new ThemeData(
    primaryColor: primaryColor,
    highlightColor: highlightColor,
    fontFamily: 'Tajawal',
    canvasColor: backgroundColor,
    backgroundColor: backgroundColor,
    indicatorColor: primaryColor.withOpacity(0.99),
    accentColor: highlightColor,
    disabledColor: disabledColor,
    cardColor: cardColor,
    unselectedWidgetColor: unselectedColor,
    primaryTextTheme: TextTheme(
        bodyText1: TextStyle(
          color: primaryColor,
          fontSize: 20,
        ),
    ),
    textTheme: TextTheme(
      headline6: TextStyle(
        fontSize: 20,
        color: primaryColor,
        fontWeight: FontWeight.bold,
      ),
      subtitle1: TextStyle(
        fontSize: 17,
        color: primaryColor,
        fontWeight: FontWeight.normal,
      ),
      subtitle2: TextStyle(
        fontSize: 13,
        color: textColor1,
        height: 1.5,
        fontWeight: FontWeight.normal,
      ),
    ),
    primaryIconTheme: IconThemeData(
      color: Colors.white,
    ),
  );
}
