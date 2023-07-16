import 'package:dio/dio.dart';

class NetworkClient {
  final dio = Dio();
  static const baseUrl = 'http://mad.codewithfaizan.com/';

  NetworkClient() {
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        error: true,
        request: false,
        requestHeader: false,
        responseBody: true,
        responseHeader: false,
      ),
    );
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    return await dio.get(baseUrl + path, queryParameters: queryParameters);
  }

  Future<Response> delete(String path,
      {Map<String, dynamic>? queryParameters}) async {
    return await dio.delete('$baseUrl$path', queryParameters: queryParameters);
  }

  Future<Response> put(String path,
      {Map<String, dynamic>? queryParameters}) async {
    return await dio.put('$baseUrl$path', queryParameters: queryParameters);
  }

  Future<Response> post(String path,
      {Map<String, dynamic>? queryParameters}) async {
    return await dio.post('$baseUrl$path', queryParameters: queryParameters);
  }
}
