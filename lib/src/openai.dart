import 'package:dio/dio.dart';
import 'package:easy_openai/src/apis/models_api/api.dart';
import 'package:easy_openai/src/constants/constants.dart';
import 'package:easy_openai/src/utils/dio.dart';

class OpenAI {
  static bool initialized = false;
  static late Dio client;

  static void init({
    required String apiKey,
    String? organizationId,
  }) {
    client = createClient(
      baseUrl: $constants.openAiBaseUrl,
      apiKey: apiKey,
      organizationId: organizationId,
    );

    initialized = true;
  }

  static ModelsApi get models => ModelsApi();
}
