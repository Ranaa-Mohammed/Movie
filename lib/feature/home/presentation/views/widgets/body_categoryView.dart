import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/core/utils/app_router.dart';
import 'package:movie/core/utils/custom_errorWidget.dart';
import 'package:movie/core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/feature/home/presentation/manger/fetchFuture_movie_cubit/fetchFuture_movie_states.dart';
import 'package:movie/feature/home/presentation/views/widgets/Rating.dart';
import 'package:movie/feature/home/presentation/views/widgets/ItemCachedImage.dart';
import '../../../../../core/utils/constans.dart';
import '../../manger/fetchFuture_movie_cubit/fetchFuture_movie_cubit.dart';
import '../details_movie.dart';

class BodyCategoryView extends StatelessWidget {
  const BodyCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchFutureMovieCubit, FetchFutureMovieStates>(
      buildWhen: (previous, current) => current is FetchCategoryMovieSuccess ||
          current is FetchCategoryMovieLoading || current is FetchCategoryMovieFailure,
      builder: (context, state) {
        if(state is FetchCategoryMovieSuccess){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                physics: BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  childAspectRatio: 1 / 1.7,
                ),
                itemCount: state.movie.length,
                itemBuilder: (BuildContext context, int index) {
                  return  GestureDetector(
                    onTap: ()
                  {
                    context.goNamed(AppRouter.kDetailsMovie, pathParameters: {"movieId": state.movie[index].id.toString()});
                    Navigator.pop(context, MaterialPageRoute(builder: (context) => DetailsMovie(movieID: state.movie[index].id.toString(),) ));
                    //print("teeeeee id :${ state.movie[index].id.toString()}" );
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            ItemCachedImage(
                                image: '$apiImage${state.movie[index].posterPath }'
                            ),
                            const SizedBox(height: 8,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Rating(
                                    rating: state.movie[index].voteAverage ?? 0,
                                ),
                                const SizedBox(height: 5,),
                                Text(state.movie[index].title ?? '', style: Styles.textStyle14, overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
            ),
          );
        }else if(state is FetchCategoryMovieFailure){
          return CustomErrorWidget(errorMessage: state.errMessage);
        }else{
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
