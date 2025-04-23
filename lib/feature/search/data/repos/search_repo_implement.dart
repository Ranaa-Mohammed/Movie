import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:movie/core/errors/failure.dart';
import 'package:movie/core/utils/api_services.dart';
import 'package:movie/feature/home/data/models/movie_model.dart';
import 'package:dio/dio.dart';
import 'package:movie/feature/search/data/repos/search_repo.dart';

class SearchRepoImplement implements SearchRepo{
  final ApiService apiService;

  SearchRepoImplement(this.apiService);



  @override
  Future<Either<Failure, List<MovieModel>>> getAllMovie() async{
    try {
      var response = await apiService.get(
          endPoint: 'movie/popular?api_key=ceb6dfe929fec3c4ac3bd8326a03342e');
      List<MovieModel> movie = [];
      for (var item in response['results']) {
        movie.add(MovieModel.fromJson(item));
      }
      return right(movie);
    }catch(e){
      if(e is DioException) {
        log(e.toString());
        return left(ServerFailure.fromDioException(e));
      }
      log(e.toString());

      return left(ServerFailure(e.toString()));
    }
  }


  @override
  Future<Either<Failure, List<MovieModel>>> search({required String query}) async{
    try {
      var response = await apiService.get(
          endPoint: 'search/movie?query=$query&api_key=ceb6dfe929fec3c4ac3bd8326a03342e');
      List<MovieModel> movie = [];
      for (var item in response['results']) {
        movie.add(MovieModel.fromJson(item));
      }
      return right(movie);
    }catch(e){
      if(e is DioException) {
        log(e.toString());
        return left(ServerFailure.fromDioException(e));
      }
      log(e.toString());

      return left(ServerFailure(e.toString()));
    }
  }

}