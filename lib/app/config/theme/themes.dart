import 'package:flutter/material.dart';
import 'package:therapeutic/app/constants/color_constants.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
      backgroundColor: ColorConstants.color_white,
      // bottomAppBarColor: Colors.cyan,
      bottomAppBarColor: ColorConstants.colorPrimary,
      /* buttonTheme: const ButtonThemeData(
      buttonColor: Colors.cyan,
      textTheme: ButtonTextTheme.primary,
    ),*/
      appBarTheme: AppBarTheme(backgroundColor: ColorConstants.colorPrimary),
      tabBarTheme: TabBarTheme(
          labelColor: ColorConstants.colorPrimary,
          unselectedLabelColor: ColorConstants.color_black),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.cyan,
        textTheme: ButtonTextTheme.primary,
      ),
// textTheme: TextTheme(bodyText1: TextStyle),



      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(
                (states) => ColorConstants.colorPrimary),
            shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
              return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8));
            }),
            textStyle: MaterialStateProperty.resolveWith<TextStyle>(
                (states) => TextStyle(color: ColorConstants.color_white))),
      ));

  static final dark = ThemeData.dark().copyWith(
      backgroundColor: ColorConstants.color_black,
      bottomAppBarColor: ColorConstants.colorPrimary,

      /*   buttonTheme: const ButtonThemeData(
      buttonColor: Colors.deepPurple,
      textTheme: ButtonTextTheme.primary,
    ),*/
      appBarTheme: AppBarTheme(backgroundColor: ColorConstants.colorPrimary),
      tabBarTheme: TabBarTheme(
          labelColor: ColorConstants.colorPrimary,
          unselectedLabelColor: ColorConstants.color_white),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.cyan,
        textTheme: ButtonTextTheme.accent,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(
                (states) => ColorConstants.colorPrimary),
            shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
              return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8));
            }),
            textStyle: MaterialStateProperty.resolveWith<TextStyle>(
                (states) => TextStyle(color: ColorConstants.color_white))),
      ));
}
