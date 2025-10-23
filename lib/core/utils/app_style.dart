import 'package:evently/core/utils/color_manager.dart';
import 'package:flutter/material.dart';

class AppStyle {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorManager.lightBackgroundColor,
    appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
    colorScheme: ColorScheme.light(
      primary: ColorManager.primaryColor,
      secondary: ColorManager.lightBlackColor,
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: ColorManager.primaryColor,
      ),
      bodySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: ColorManager.lightBlackColor,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorManager.darkBackgroundColor,
    appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
    colorScheme: ColorScheme.dark(
      primary: ColorManager.primaryColor,
      secondary: ColorManager.darkWhiteColor,
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: ColorManager.primaryColor,
      ),
      bodySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: ColorManager.darkWhiteColor,
      ),
    ),
  );
}
