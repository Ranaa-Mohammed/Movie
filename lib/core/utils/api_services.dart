import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = 'https://api.themoviedb.org/3/'; // Set your base URL here
  final Dio _dio;

  ApiService(this._dio);

  // Helper method to add token to the headers if provided
  Options _getOptionsWithToken([String? token]) {
    if (token != null) {
      return Options(headers: {'Authorization': 'Bearer $token'});
    }
    return Options();
  }

  // GET
  Future<Map<String, dynamic>> get({
    required String endPoint,
    String? token,
    Map<String, dynamic>? queryParameters,
  }) async {
    var options = _getOptionsWithToken(token);
    var response = await _dio.get('$_baseUrl$endPoint', options: options , queryParameters: queryParameters);
    return response.data;
  }

  // POST
  Future<Map<String, dynamic>> post({
    required String endPoint,
    required Map<String, dynamic> data,
    String? token,
    Map<String, dynamic>? queryParameters,
  }) async {
    var options = _getOptionsWithToken(token);
    var response = await _dio.post(
      '$_baseUrl$endPoint',
      data: data,
      options: options,
      queryParameters: queryParameters,
    );
    return response.data;
  }

  //Upload File

  Future<Map<String, dynamic>> uploadFile({
    required String endPoint,
    required FormData data,
    String? token,
    Map<String, dynamic>? queryParameters,
  }) async {
    var options = _getOptionsWithToken(token);
    var response = await _dio.post('$_baseUrl$endPoint',
        data: data, options: options, queryParameters: queryParameters);
    return response.data;
  }

  // DELETE
  Future<Map<String, dynamic>> delete(
      {required String endPoint,
        String? token,
        Map<String, dynamic>? queryParameters
      }) async {
    var options = _getOptionsWithToken(token);
    var response = await _dio.delete('$_baseUrl$endPoint',
        options: options, queryParameters: queryParameters);
    return response.data;
  }

  // PUT
  Future<Map<String, dynamic>> put(
      {required String endPoint,
        required Map<String, dynamic> data,
        String? token,
        Map<String, dynamic>? queryParameters}) async {
    var options = _getOptionsWithToken(token);
    var response = await _dio.put('$_baseUrl$endPoint',
        data: data, options: options, queryParameters: queryParameters);
    return response.data;
  }
}