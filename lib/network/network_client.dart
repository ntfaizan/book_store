import 'package:dio/dio.dart';

class NetworkClient {
  final dio = Dio();
  static const baseUrl = 'http://mad.codewithfaizan.com/';

  Future<Response> get(String url,
      [Map<String, dynamic>? queryParameters]) async {
    return await dio.get(baseUrl + url, queryParameters: queryParameters);
  }

  Future<Response> delete(String url, int urlParameter) async {
    return await dio.delete('$baseUrl$url$urlParameter');
  }
}
