import 'package:dio/dio.dart';
import 'package:easy_openai/easy_openai.dart';

abstract class BaseApi {
  Dio get _client => OpenAI.client;
  bool get initialized => OpenAI.initialized;

  Future<Response<dynamic>> httpGet(
    String path, {
    Map<String, dynamic>? queryParams,
  }) {
    if (!initialized) {
      throw UnInitializedException();
    }

    return _client.get(
      path,
      queryParameters: queryParams,
    );
  }

  Future<Response<dynamic>> httpPost(
    String path, {
    Map<String, dynamic>? queryParams,
    Object? data,
  }) {
    if (!initialized) {
      throw UnInitializedException();
    }

    return _client.post(
      path,
      queryParameters: queryParams,
      data: data,
    );
  }
}
