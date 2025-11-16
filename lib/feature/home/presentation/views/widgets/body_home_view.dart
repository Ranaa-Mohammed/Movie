
import 'package:flutter/material.dart';
import 'package:movie/core/utils/api_services.dart';
import 'package:movie/core/utils/service_locator.dart';
import 'package:movie/core/utils/styles.dart';
import 'package:movie/feature/home/data/repos/home_repo_implement.dart';
import 'package:movie/feature/home/presentation/views/widgets/custom_carouselSlider.dart';
import '../../manger/fetchFuture_movie_cubit/fetchFuture_movie_cubit.dart';
import '../../manger/fetch_movie_cubit/fetch_movie_cubit.dart';
import 'custom_appBar.dart';
import 'custom_comingSoon.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BodyHomeView extends StatelessWidget {
   const BodyHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomAppbar(),
          Text(
            'Now Playing',
            style: Styles.textStyle30,
          ),
          MultiBlocProvider(
           providers: [
                  BlocProvider(create: (context) => FetchMovieCubit(getIt.get<HomeRepoImplement>())..fetchMovieCubit()),
             BlocProvider(create: (context) => FetchFutureMovieCubit(getIt.get<HomeRepoImplement>())..fetchFutureMovieCubit(),
             ),
           ],
            child: Column(
                children: const [
                  SizedBox(height: 10,),
                  CustomCarouselSlider(),
                  SizedBox(height: 20,),
                  CustomComingSoon(),
                ],
              ),
          ),
        ],
      ),
    );
  }
}

