import 'package:movie/feature/home/data/models/details.dart';
import 'package:movie/feature/home/data/models/movie_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';

abstract class HomeRepo {

  Future<Either<Failure, List<MovieModel>>> fetchMovie();
  Future<Either<Failure, List<MovieModel>>> fetchFutureMovie();
  Future<Either<Failure, List<MovieModel>>> fetchCategoryMovie();
  Future<Either<Failure, DetailsModel>> detailsMovie({required String movieId});


}