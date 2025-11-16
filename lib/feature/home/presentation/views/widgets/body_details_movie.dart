import 'package:flutter/material.dart';
import 'package:movie/core/utils/custom_errorWidget.dart';
import '../../../../../core/utils/constans.dart';
import '../../../../../core/utils/styles.dart';
import '../../manger/fetchFuture_movie_cubit/fetchFuture_movie_cubit.dart';
import '../../manger/fetchFuture_movie_cubit/fetchFuture_movie_states.dart';
import 'ItemCachedImage.dart';
import 'Rating.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyDetailsMovie extends StatelessWidget {
  const BodyDetailsMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchFutureMovieCubit, FetchFutureMovieStates>(
      buildWhen: (previous, current) => current is DetailsMovieLoading || current is DetailsMovieFailure ||
      current is  DetailsMovieSuccess,
      builder: (BuildContext context,  state) {
        if(state is DetailsMovieSuccess){
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: ItemCachedImage(
                        image: '$apiImage${state.movie.posterPath}',
                    ),
                  ),
                  // SizedBox(height: 20,),
                  Text(
                    state.movie.title ?? '',style: Styles.textStyle18, overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                       Rating(
                         rating: state.movie.voteAverage ?? 0,
                      ),
                      const SizedBox(width: 40,),
                      Text(
                          state.movie.releaseDate ?? '', style: Styles.textStyle16),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    state.movie.overview ?? '',style: Styles.textStyle20,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        }else if(state is DetailsMovieFailure){
          return CustomErrorWidget(errorMessage: state.errMessage);
        }else{
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
