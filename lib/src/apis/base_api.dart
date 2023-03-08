import 'package:dio/dio.dart';
import 'package:easy_openai/easy_openai.dart';
import 'package:easy_openai/src/constants/constants.dart';
import 'package:easy_openai/src/openai.dart';
import 'package:easy_openai/src/utils/dio.dart';

abstract class BaseApi {
  late final Dio client;

  BaseApi() {
    if (!isInitialized) {
      throw UnInitializedException();
    }

    if (apiKey == null || apiKey!.isEmpty) {
      throw InvalidAPIKeyException();
    }

    client = createClient(
      baseUrl: $constants.openAiBaseUrl,
      apiKey: apiKey!,
      organizationId: organizationId,
    );
  }
}
