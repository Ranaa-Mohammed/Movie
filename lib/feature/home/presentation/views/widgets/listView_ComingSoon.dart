
import 'package:flutter/material.dart';
import 'package:movie/core/utils/constans.dart';
import 'package:movie/core/utils/custom_errorWidget.dart';
import 'package:movie/feature/home/presentation/views/widgets/ItemCachedImage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manger/fetchFuture_movie_cubit/fetchFuture_movie_cubit.dart';
import '../../manger/fetchFuture_movie_cubit/fetchFuture_movie_states.dart';

class ListviewComingSoon extends StatelessWidget {
  const ListviewComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchFutureMovieCubit, FetchFutureMovieStates>(
      builder: (context, state) {
        if(state is FetchFutureMovieSuccess){
         // log(state.movie[0].posterPath.toString());
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            // height: 170,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: state.movie.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>  ItemCachedImage( image:
              '$apiImage${state.movie[index].posterPath }',
              ),
            ),
          );
        }else if(state is FetchFutureMovieFailure){
          return CustomErrorWidget(errorMessage: state.errMessage,);
        }else{
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
