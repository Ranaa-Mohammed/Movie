import 'package:flutter/material.dart';
import 'package:movie/core/config/theme/cubit/theme_cubit.dart';
import 'package:movie/core/config/theme/cubit/theme_states.dart';
import 'package:movie/core/config/theme/theme_data/them_data_dark.dart';
import 'package:movie/core/config/theme/theme_data/theme_data_light.dart';
import 'package:movie/core/utils/app_router.dart';
import 'package:movie/core/utils/simple_bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utils/service_locator.dart';


void main() {
   Bloc.observer = SimpleBlocObserver();
   setUpService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeStates>(
        builder: (context, state) {
          return MaterialApp.router(
          routerConfig: AppRouter.router,
           darkTheme: getDarkTheme(),
          themeMode: state is InitThemeState ? ThemeMode.system :
          state is LightThemeState ? ThemeMode.light :
          ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          theme: getLightTheme(),
        
        );
        },
      ),
    );
  }
}

