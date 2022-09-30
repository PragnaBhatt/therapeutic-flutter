import 'package:flutter/material.dart';
import 'package:therapeutic/app/constants/color_constants.dart';

// ThemeData darkTheme = ThemeData(
//   brightness: Brightness.dark,
//   scaffoldBackgroundColor: Colors.black,
//   backgroundColor: Colors.black,
//   // fontFamily: CommonConstants.FONT_FAMILY_REGULAR,
//   // bottomNavigationBarTheme: BottomNavigationBarThemeData(
//   //   backgroundColor: Colors.black,
//   //   unselectedItemColor: Colors.white,
//   //   selectedItemColor: Colors.redAccent,
//   //   elevation: 0,
//   // ),
//   highlightColor: Colors.transparent,
//   splashColor: Colors.transparent,
//   appBarTheme: AppBarTheme(
//     color: ColorConstants.color_logo_with_65_opacity,
//     elevation: 0,
//     textTheme: TextTheme(
//       headline6: TextStyle(
//         color: Colors.white,
//         fontSize: 20,
//       ),
//     ),
//   ),
// );
ThemeData darkTheme = ThemeData(
colorScheme: ColorScheme.dark(
primary: ColorConstants.colorPrimary, //primary
secondary: ColorConstants.color_logo_with_75_opacity,
background: ColorConstants.color_logo_with_35_opacity,
error: Colors.red,
brightness: Brightness.dark,

),
primarySwatch: ColorConstants.customAccentColor);