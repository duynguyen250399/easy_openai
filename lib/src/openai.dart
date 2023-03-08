import 'package:easy_openai/src/apis/models_api/api.dart';

class OpenAI {
  static String? _apiKey;
  static String? _organizationId;
  static bool _initialized = false;

  static void init({
    required String apiKey,
    String? organizationId,
  }) {
    _apiKey = apiKey;
    _organizationId = organizationId;
    _initialized = true;
  }

  static ModelsApi get models => ModelsApi();
}

String? get apiKey => OpenAI._apiKey;
String? get organizationId => OpenAI._organizationId;
bool get isInitialized => OpenAI._initialized;
