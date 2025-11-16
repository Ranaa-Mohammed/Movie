import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/feature/home/data/models/movie_model.dart';
import 'package:movie/feature/home/data/repos/home_repo.dart';
import 'fetchFuture_movie_states.dart';


class FetchFutureMovieCubit extends Cubit<FetchFutureMovieStates>{
  FetchFutureMovieCubit(this.homeRepo) : super(FetchFutureMovieInitial());
final HomeRepo homeRepo;

int page = 497;

List<MovieModel> movie = [];


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

  Future<void> fetchCategoryMovieCubit({ bool isLoadingMore = false}) async{

    if(isLoadingMore){
      emit(CategoryPaginationLoading());
    }else{
  emit(FetchCategoryMovieLoading());
    }
    var result = await homeRepo.fetchCategoryMovie(page: page);
    result.fold(
            (failure){
              if(isLoadingMore){
                emit(CategoryPaginationFailure());
              }else{
          emit(FetchCategoryMovieFailure(failure.errorMessage));
              }
        },
            (success){
               if(success.isNotEmpty){
                      page++;
                   movie.addAll(success);
                      }
          emit(FetchCategoryMovieSuccess(movie));
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