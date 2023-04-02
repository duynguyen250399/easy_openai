import 'package:dio/dio.dart';
import 'package:easy_openai/src/constants/constants.dart';
import 'package:easy_openai/src/openai.dart';
import 'package:easy_openai/src/utils/dio.dart';

export 'model_api.dart';

class OpenAIAPI {
  late final Dio _client;
  Dio get client => _client;

  OpenAIAPI() {
    _client = createClient(
      baseUrl: $constants.openAiBaseUrl,
      secretApiKey: secretApiKey,
      version: apiVersion,
    );
  }

  void setVersion(int version) {
    _client = createClient(
      baseUrl: $constants.openAiBaseUrl,
      secretApiKey: secretApiKey,
      version: version,
    );
  }

  Future<Response<dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParams,
  }) {
    return _client.get(
      path,
      queryParameters: queryParams,
    );
  }

  Future<Response<dynamic>> post(
    String path, {
    Map<String, dynamic>? queryParams,
    Object? data,
  }) {
    return _client.post(
      path,
      queryParameters: queryParams,
      data: data,
    );
  }
}
