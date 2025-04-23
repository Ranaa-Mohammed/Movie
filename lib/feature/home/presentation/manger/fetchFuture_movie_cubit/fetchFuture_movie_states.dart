
import 'package:movie/feature/home/data/models/details.dart';

import '../../../data/models/movie_model.dart';

abstract class FetchFutureMovieStates {}


class FetchFutureMovieInitial extends FetchFutureMovieStates {}

class FetchFutureMovieLoading extends FetchFutureMovieStates {}

class FetchFutureMovieFailure extends FetchFutureMovieStates {
  final String errMessage;

  FetchFutureMovieFailure(this.errMessage);
}

class FetchFutureMovieSuccess extends FetchFutureMovieStates {
  final List<MovieModel> movie;

  FetchFutureMovieSuccess(this.movie);
}


class FetchCategoryMovieLoading extends FetchFutureMovieStates {}

class FetchCategoryMovieFailure extends FetchFutureMovieStates {
  final String errMessage;

  FetchCategoryMovieFailure(this.errMessage);
}

class FetchCategoryMovieSuccess extends FetchFutureMovieStates {
  final List<MovieModel> movie;

  FetchCategoryMovieSuccess(this.movie);
}


class DetailsMovieLoading extends FetchFutureMovieStates {}

class DetailsMovieFailure extends FetchFutureMovieStates {
  final String errMessage;

  DetailsMovieFailure(this.errMessage);
}

class DetailsMovieSuccess extends FetchFutureMovieStates {
  final DetailsModel movie;

  DetailsMovieSuccess(this.movie);
}