import 'package:flutter/material.dart';
import 'package:movie/core/config/theme/cubit/theme_cubit.dart';
import 'package:movie/core/config/theme/cubit/theme_states.dart';
import 'package:movie/core/utils/assets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Image.asset(
              AssetsData.logo,
              height: 100,
              width: 100,
            ),
          ),

          BlocBuilder<ThemeCubit, ThemeStates>(
            builder: (context, state) {
              return  Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  if(Theme.of(context).brightness == Brightness.dark){
                    context.read<ThemeCubit>().updateTheme(ThemeMode.light);
                  }else{
                     context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                  }
                },
                icon: Icon(
                  Icons.dark_mode_sharp,
                  size: 35,
                ),
              ),
            );
            },
            ),
        ],
      ),
    );
  }
}