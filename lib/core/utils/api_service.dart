import 'package:dio/dio.dart';
class ApiService {
  final Dio _dio;
  ApiService({required Dio dio}) : _dio = dio;
  final String _baseUrl = "https://www.googleapis.com/books/v1/";
  Future<Map<String, dynamic>> getData({required String endPoint}) async {
    var response = await _dio.get("$_baseUrl$endPoint");
    return response.data;
  }
}
