import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:movie/core/errors/failure.dart';
import 'package:movie/core/utils/api_services.dart';
import 'package:movie/feature/home/data/models/details.dart';
import 'package:movie/feature/home/data/models/movie_model.dart';
import 'package:movie/feature/home/data/repos/home_repo.dart';
import 'package:dio/dio.dart';

class HomeRepoImplement implements HomeRepo{
 final ApiService apiService;

  HomeRepoImplement(this.apiService);

  @override
  Future<Either<Failure, List<MovieModel>>> fetchFutureMovie() async{
    try {
      var response = await apiService.get(
          endPoint: 'movie/popular?api_key=ceb6dfe929fec3c4ac3bd8326a03342e'
          );
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
  Future<Either<Failure, List<MovieModel>>> fetchMovie() async{
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
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }


  @override
  Future<Either<Failure, List<MovieModel>>> fetchCategoryMovie({required int page}) async{
    try {
      var response = await apiService.get(
          endPoint: 'movie/popular?api_key=ceb6dfe929fec3c4ac3bd8326a03342e',
          queryParameters: {
            'page' : page,
          },
          );
      List<MovieModel> movie = [];
      for (var item in response['results']) {
        movie.add(MovieModel.fromJson(item));
      }
      return right(movie);
    }catch(e){
      if(e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DetailsModel>> detailsMovie({required String movieId}) async{
    try {
      final response = await apiService.get(
          endPoint: 'movie/$movieId?api_key=ceb6dfe929fec3c4ac3bd8326a03342e');

      final movie = DetailsModel.fromJson(response);
      return right(movie);
    }catch(e){
      if(e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }


}