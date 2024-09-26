import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppThemes {

  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.lightPrimaryColor,
    colorScheme: ColorScheme.dark(
      primary: AppColors.lightPrimaryColor,
      background: AppColors.lightBackgroundColor,
    ),
    scaffoldBackgroundColor: AppColors.lightBorderColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightPrimaryColor,
      titleTextStyle: AppTextStyles.lightBold.copyWith(color: Colors.white),
    ),
    textTheme: TextTheme(
      displayLarge: AppTextStyles.lightBold.copyWith(fontSize: 20.0),
      bodyLarge: AppTextStyles.lightMedium,
      bodyMedium: AppTextStyles.lightRegular,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.lightPrimaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.darkPrimaryColor,
    colorScheme: ColorScheme.dark(
      primary: AppColors.darkPrimaryColor,
      background: AppColors.darkBackgroundColor,
    ),
    scaffoldBackgroundColor: AppColors.darkBorderColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkPrimaryColor,
      titleTextStyle: AppTextStyles.darkBold.copyWith(color: Colors.white),
    ),
    textTheme: TextTheme(
      displayLarge: AppTextStyles.darkBold.copyWith(fontSize: 20.0),
      bodyLarge: AppTextStyles.darkMedium,
      bodyMedium: AppTextStyles.darkRegular,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.darkPrimaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
