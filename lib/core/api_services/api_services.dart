import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio;

  ApiServices({required Dio dio}) : _dio = dio;
  final String baseUrl = 'https://api.themoviedb.org/3/';
  final String apiKey='api_key=6b75e8bf4a56e9345731af70de9d7772';
  Future<Map<String, dynamic>> get({required String endpoin}) async {
    Response response = await _dio.get('$baseUrl$endpoin$apiKey');
    Map<String, dynamic> jsonData = response.data;
    return jsonData;
  }
}


// 'https://api.themoviedb.org/3/search/movie?query=bord?api_key=6b75e8bf4a56e9345731af70de9d7772'