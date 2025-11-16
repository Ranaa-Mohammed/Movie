import 'package:flutter/material.dart';
import 'package:movie/core/utils/service_locator.dart';
import 'package:movie/feature/home/presentation/manger/fetchFuture_movie_cubit/fetchFuture_movie_states.dart';
import 'package:movie/feature/home/presentation/views/widgets/body_categoryView.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repos/home_repo_implement.dart';
import '../manger/fetchFuture_movie_cubit/fetchFuture_movie_cubit.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
         create: (context) => FetchFutureMovieCubit(getIt.get<HomeRepoImplement>())..fetchCategoryMovieCubit(),
        child: Scaffold(
        body: BodyCategoryView(),
        bottomNavigationBar: SizedBox(
          height: 30,
          child: BlocBuilder<FetchFutureMovieCubit, FetchFutureMovieStates>(
            buildWhen: (previous, current) => current is CategoryPaginationFailure || current is CategoryPaginationLoading
            || current is FetchCategoryMovieSuccess,
            builder: (context, state) {
              if(state is CategoryPaginationLoading){
                 return const Center(child: CircularProgressIndicator());
              }else if(state is CategoryPaginationFailure) {
                    return const Center(child: Text('No More Items'));
              } else {
            return const SizedBox.shrink();
                            }
            },
            ),
        ),
        
        ),
      ),
    );
  }
}
