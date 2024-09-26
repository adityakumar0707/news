import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const TextStyle lightBold = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
    color: AppColors.lightPrimaryColor,
  );

  static const TextStyle lightMedium = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
    color: AppColors.lightSecondaryColor,
  );

  static const TextStyle lightRegular = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.normal,
    fontSize: 14.0,
    color: AppColors.lightBorderColor,
  );


  static const TextStyle darkBold = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
    color: AppColors.darkPrimaryColor,
  );

  static const TextStyle darkMedium = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
    color: AppColors.darkSecondaryColor,
  );

  static const TextStyle darkRegular = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.normal,
    fontSize: 14.0,
    color: AppColors.darkBorderColor,
  );
}
