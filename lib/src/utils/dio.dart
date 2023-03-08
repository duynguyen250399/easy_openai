import 'package:dio/dio.dart';

Dio createClient({
  required String baseUrl,
  required String apiKey,
  String? organizationId,
}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'Authorization': 'Bearer $apiKey',
        if (organizationId != null) 'OpenAI-Organization': organizationId,
      },
    ),
  );

  return dio;
}
