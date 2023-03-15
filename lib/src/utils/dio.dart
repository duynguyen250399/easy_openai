import 'package:dio/dio.dart';

Dio createClient({
  required String baseUrl,
  required String secretApiKey,
  required int version,
  String? organizationId,
}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: '$baseUrl/v$version',
      headers: {
        'Authorization': 'Bearer $secretApiKey',
        if (organizationId != null) 'OpenAI-Organization': organizationId,
      },
    ),
  );

  return dio;
}
