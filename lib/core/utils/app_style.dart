import 'package:evently/core/utils/color_manager.dart';
import 'package:flutter/material.dart';

class AppStyle {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorManager.lightBackgroundColor,
    appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
    colorScheme: ColorScheme.light(
      primary: ColorManager.primaryColor,
      secondary: ColorManager.lightBlackColor,
      error: ColorManager.redColor,
      tertiary: ColorManager.greyColor,
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
      labelSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: ColorManager.primaryColor,
        decoration: TextDecoration.underline,
        decorationColor: ColorManager.primaryColor,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorManager.darkBackgroundColor,
    appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
    colorScheme: ColorScheme.dark(
      primary: ColorManager.primaryColor,
      secondary: ColorManager.darkWhiteColor,
      error: ColorManager.redColor,
      tertiary: ColorManager.greyColor,
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
      labelSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: ColorManager.primaryColor,
        decoration: TextDecoration.underline,
        decorationColor: ColorManager.primaryColor,
      ),
    ),
  );
}
