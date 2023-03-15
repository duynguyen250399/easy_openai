import 'package:dio/dio.dart';
import 'package:easy_openai/src/constants/constants.dart';
import 'package:easy_openai/src/utils/dio.dart';

export 'model_api.dart';

abstract class OpenAIAPI {
  final String secretApiKey;
  final String? organizationId;
  final int version;

  OpenAIAPI({
    required this.secretApiKey,
    required this.organizationId,
    required this.version,
  }) : _client = createClient(
          baseUrl: $constants.openAiBaseUrl,
          secretApiKey: secretApiKey,
          version: version,
        );

  late final Dio _client;
  Dio get client => _client;

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
