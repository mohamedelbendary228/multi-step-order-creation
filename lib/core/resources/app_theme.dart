import 'package:baridx_order_creation/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    useMaterial3: false,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.bgColor,
    fontFamily: "Cairo",
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0.0,
    ),
    indicatorColor: AppColors.primaryColor,
  );
}
