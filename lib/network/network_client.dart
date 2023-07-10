import 'dart:convert';

import 'package:dio/dio.dart';

class NetworkClient {
  final dio = Dio();
  static const baseUrl = 'http://mad.codewithfaizan.com/';

  Future<Map<String, dynamic>> get(String url,
      [Map<String, dynamic>? queryParameters]) async {
    final response =
        await dio.get(baseUrl + url, queryParameters: queryParameters);
    return json.decode(response.toString());
  }
}
