
import 'package:movie/feature/home/data/models/movie_model.dart';

abstract class FetchMovieStates {}


class FetchMovieInitial extends FetchMovieStates {}

class FetchMovieLoading extends FetchMovieStates {}

class FetchMovieFailure extends FetchMovieStates {
  final String errMessage;

  FetchMovieFailure(this.errMessage);
}

class FetchMovieSuccess extends FetchMovieStates {
  final List<MovieModel> movie;

  FetchMovieSuccess(this.movie);
}