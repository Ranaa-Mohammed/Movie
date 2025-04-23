
import '../../../../home/data/models/movie_model.dart';

abstract class SearchStates {}


class SearchInitial extends SearchStates {}

class SearchLoading extends SearchStates {}

class SearchFailure extends SearchStates {
  final String errMessage;

  SearchFailure(this.errMessage);
}

class SearchSuccess extends SearchStates {
 final List<MovieModel> search;

 SearchSuccess(this.search);
}