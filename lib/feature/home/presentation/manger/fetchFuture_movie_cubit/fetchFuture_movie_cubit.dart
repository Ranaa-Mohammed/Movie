import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/feature/home/data/repos/home_repo.dart';
import 'fetchFuture_movie_states.dart';


class FetchFutureMovieCubit extends Cubit<FetchFutureMovieStates>{
  FetchFutureMovieCubit(this.homeRepo) : super(FetchFutureMovieInitial());
final HomeRepo homeRepo;

 Future<void> fetchFutureMovieCubit() async{
    var result = await homeRepo.fetchFutureMovie();
    result.fold(
            (failure){
              emit(FetchFutureMovieFailure(failure.errorMessage));
            },
            (success){
              emit(FetchFutureMovieSuccess(success));
            }
    );
  }

  Future<void> fetchCategoryMovieCubit() async{
    var result = await homeRepo.fetchCategoryMovie();
    result.fold(
            (failure){
          emit(FetchCategoryMovieFailure(failure.errorMessage));
        },
            (success){
          emit(FetchCategoryMovieSuccess(success));
        }
    );
  }


  Future<void> detailsMovieCubit({required String movieId}) async{
    var result = await homeRepo.detailsMovie(movieId: movieId);
    result.fold(
            (failure){
          emit(DetailsMovieFailure(failure.errorMessage));
        },
            (movie){
          emit(DetailsMovieSuccess(movie));
        }
    );
  }

}