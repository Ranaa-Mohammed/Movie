import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/feature/home/data/repos/home_repo.dart';
import 'package:movie/feature/home/presentation/manger/fetch_movie_cubit/fetch_movie_states.dart';

class FetchMovieCubit extends Cubit<FetchMovieStates>{
  FetchMovieCubit(this.homeRepo) : super(FetchMovieInitial() );

final HomeRepo homeRepo;
 Future<void> fetchMovieCubit() async{
   emit(FetchMovieLoading());
   var result = await homeRepo.fetchMovie();
   result.fold(
           (failure){
             emit(FetchMovieFailure(failure.errorMessage));
           },
           (movie){
             emit(FetchMovieSuccess(movie));
           }
   );
 }
}