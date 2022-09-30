import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:therapeutic/app/constants/color_constants.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.light(
    primary: ColorConstants.colorPrimary, //primary dark
    primaryVariant: ColorConstants.colorPrimary, //primary
    secondary: ColorConstants.colorAccent,
    secondaryVariant: ColorConstants.colorAccent,
    background: ColorConstants.colorCanvas,
    error: Colors.red,
    brightness: Brightness.light,
  ),
  primarySwatch: ColorConstants.customAccentColor,

  // fontFamily: CommonConstants.FONT_FAMILY_REGULAR,

  // backgroundColor: ColorConstants.colorCanvas,
  // appBarTheme: AppBarTheme(
  //   centerTitle: true,
  //   color: ColorConstants.appbar_color,
  //   elevation: 0,
  //   iconTheme: IconThemeData(
  //     color: Colors.black,
  //   ),
  //   textTheme: TextTheme(
  //     headline6: TextStyle(
  //       color: Colors.black,
  //       fontSize: SizeConstants.appbar_font_size,
  //       fontWeight: FontWeight.w400,
  //     ),
  //   ),
  // ),
);
