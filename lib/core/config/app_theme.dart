import 'package:flutter/material.dart';

class AppTheme {

  static const Color textClr = Color(0xffffffff);
  static const Color greyClr = Color(0xff737379);


  static const Color error = Color(0xffFF472B);
  static const Color success = Color(0xff60C631);

  static const Color primaryClr = Color(0xff3366FF);
  static const Color infoClr = Color(0xff02337A);
  static const Color authTextClr = Color(0xff363F5E);

  static const Color neutral100 = Color(0xffF4F4F5);
  static const Color neutral200 = Color(0xffE5E7EB);
  static const Color neutral300 = Color(0xffD1D5DB);
  static const Color neutral400 = Color(0xff9CA3AF);
  static const Color neutral500 = Color(0xff6B7280);
  static const Color neutral600 = Color(0xff4B5563);
  static const Color neutral700 = Color(0xff374151);
  static const Color neutral800 = Color(0xff1F2937);
  static const Color neutral900 = Color(0xff111827);


  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "SF Pro Display",
    brightness: Brightness.dark,
  );

  static ThemeData theme = ThemeData(
    useMaterial3: true,
    fontFamily: "SF Pro Display",
    brightness: Brightness.light, colorScheme: ColorScheme.light(background: Colors.white)
  );

  static ThemeMode? getThemeMode(){
    return ThemeMode.light;
  }

}