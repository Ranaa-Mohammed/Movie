import 'package:flutter/material.dart';
import 'package:movie/core/config/theme/app_colors.dart';

ThemeData getDarkTheme() {
  return ThemeData(

scaffoldBackgroundColor: AppColors.primary0,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary0,
      brightness: Brightness.dark,
    ),
    textTheme: ThemeData.light().textTheme.apply(
          bodyColor: AppColors.primary1,
          displayColor: AppColors.primary1,
        ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.primary0,
        selectedItemColor: AppColors.primary1,
        unselectedItemColor: Colors.grey,
        
        
    ),

    cardTheme: CardThemeData(
      color: Colors.grey.shade200,
      shadowColor: Colors.black12,
      surfaceTintColor: Colors.transparent,
      
    ),
        
  );
}