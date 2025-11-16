import 'package:flutter/material.dart';
import 'package:movie/core/config/theme/app_colors.dart';

ThemeData getLightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.primary1,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary1,
      brightness: Brightness.light,
    ),
    textTheme: ThemeData.light().textTheme.apply(
          bodyColor: AppColors.primary0,
          displayColor: AppColors.primary0,
        ),
         bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.primary1,
        selectedItemColor: AppColors.primary0,
        unselectedItemColor: Colors.grey,
        
        
    ),

     cardTheme: CardThemeData(
      color: Colors.grey.shade900,
      shadowColor: Colors.black45,
      surfaceTintColor: Colors.transparent,
    ),
  );
}