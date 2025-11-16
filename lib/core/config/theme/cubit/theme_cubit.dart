import 'package:flutter/material.dart';
import 'package:movie/core/config/theme/cubit/theme_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeStates>{

  ThemeCubit() : super(InitThemeState());


  void updateTheme ( ThemeMode themeMode) {

       if(themeMode == ThemeMode.light){
        emit(LightThemeState());
       } else if(themeMode == ThemeMode.dark){
        emit(DarkThemeState());
       }else{
        emit(InitThemeState());
       }
  }

}