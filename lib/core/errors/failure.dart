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

factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    String message = 'Oops, there was an error, please try again';

    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      if (response is Map<String, dynamic>) {
        message = response['error']?['message'] ??
            response['status_message'] ??
            'Unauthorized request';
      } else {
        message = 'Unauthorized request';
      }
    } else if (statusCode == 404) {
      message = 'Your request was not found, please try later';
    } else if (statusCode == 500) {
      message = 'Internal server error, please try later';
    }

    return ServerFailure(message);
  }
    

}