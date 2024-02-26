import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../constants/app_const.dart';

ThemeData getThemeDate() {
  return ThemeData(
    inputDecorationTheme: InputDecorationTheme(
        errorMaxLines: 1,
        hintStyle: TextStyle(
          fontFamily: AppConstants.fontFamily,
          color: AppColors.hintColor,
        ),
        errorStyle: TextStyle(
          color: Colors.red.shade800,
          fontSize: AppConstants.nanoText,
          fontFamily: AppConstants.fontFamily,
          fontWeight: FontWeight.w500,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 5.h,
        ),
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none),
    primaryColor: AppColors.primaryColor,
    fontFamily: AppConstants.fontFamily,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primaryColor,
      error: Colors.red.shade800,
      onError: Colors.red.shade800,
      background: AppColors.background,
      onBackground: AppColors.background,
      surface: AppColors.fontColor,
      onSurface: AppColors.fontColor,
      onPrimary: AppColors.primaryColor,
      secondary: AppColors.fontColor,
      onSecondary: AppColors.fontColor,
    ),
  );
}
