import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioException( DioException dioException){
    switch(dioException.type){

      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.badCertificate:
        return ServerFailure('rr');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioException.response!.statusCode!, dioException.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceld');

      case DioExceptionType.connectionError:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, Please try again!');

      case DioExceptionType.unknown:
        return ServerFailure('Request to ApiServer was unknown');
      default:
        return ServerFailure('Opps There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse (int statusCodee, dynamic response){

    if( statusCodee == 400 || statusCodee == 401 || statusCodee == 403){
      return ServerFailure(response['error']['message']);
    }else if(statusCodee == 404){
      return ServerFailure('Your request not found, Please try later!');
    }else if(statusCodee == 500){
      return ServerFailure('Internal Server error, Please try later');
    }else {
      return ServerFailure('Opps There was an Error, Please try again');
    }
  }

}