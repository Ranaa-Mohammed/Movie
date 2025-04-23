import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../home/data/models/movie_model.dart';

abstract class SearchRepo {

  Future<Either<Failure, List<MovieModel>>> getAllMovie();
  Future<Either<Failure, List<MovieModel>>> search({required String query});



}