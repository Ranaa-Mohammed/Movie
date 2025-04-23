import 'package:flutter/material.dart';
import 'package:movie/core/utils/service_locator.dart';
import 'package:movie/feature/home/presentation/views/widgets/body_categoryView.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repos/home_repo_implement.dart';
import '../manger/fetchFuture_movie_cubit/fetchFuture_movie_cubit.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => FetchFutureMovieCubit(getIt.get<HomeRepoImplement>())..fetchCategoryMovieCubit(),
            child: BodyCategoryView(),
        ),
      ),
    );
  }
}
