import 'package:easy_openai/easy_openai.dart';

class OpenAI {
  static String _secretApiKey = '';
  static String? _organizationId;
  static int _version = 1;
  static bool _initialized = false;

  OpenAI._();

  static void initialize({
    required String secretApiKey,
    String? organizationId,
    int version = 1,
  }) {
    _secretApiKey = secretApiKey;
    _organizationId = organizationId;
    _version = version;
    _initialized = true;
  }

  bool get initialized => _initialized;

  static void setSecretApiKey(String value) {
    assert(value.isNotEmpty, '[secretApiKey] must not be empty.');
    _secretApiKey = value;
  }

  static void setOrganizationId(String? value) {
    assert(
      value == null || value.isNotEmpty,
      '[organizationId] must be null (optional) or not be empty.',
    );
    _organizationId = value;
  }

  static void setVersion(int value) {
    assert(value >= 1, '[version] must be >= 1');
    _version = value;
  }

  static ModelAPI get modelAPI => _createApi();

  static T _createApi<T extends OpenAIAPI>() {
    if (!_initialized) {
      throw NotInitializedException();
    }

    return OpenAIAPI() as T;
  }
}

final secretApiKey = OpenAI._secretApiKey;
final organizationId = OpenAI._organizationId;
final apiVersion = OpenAI._version;
