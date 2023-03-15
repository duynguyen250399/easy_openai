import 'package:easy_openai/src/apis/api.dart';
import 'package:easy_openai/src/apis/model_api.dart';
import 'package:easy_openai/src/exceptions/exceptions.dart';

class OpenAI {
  String _secretApiKey;
  String? _organizationId;
  int _version;

  OpenAI({
    required String secretApiKey,
    String? organizationId,
    int version = 1,
  })  : _secretApiKey = secretApiKey,
        _organizationId = organizationId,
        _version = version;

  set secretApiKey(String value) {
    assert(
        value.isNotEmpty, '[$runtimeType] [secretApiKey] must not be empty.');
    _secretApiKey = value;
  }

  set organizationId(String? value) {
    assert(
      value == null || value.isNotEmpty,
      '[$runtimeType] [organizationId] must be null (optional) or not be empty.',
    );
    _organizationId = value;
  }

  set version(int value) {
    assert(value >= 1, '[$runtimeType] [version] must be >= 1');
    _version = value;
  }

  ModelAPI get modelAPI => _create();

  T _create<T extends OpenAIAPI>() {
    switch (T) {
      case ModelAPI:
        return ModelAPI(
          secretApiKey: _secretApiKey,
          organizationId: _organizationId,
          version: _version,
        ) as T;
      default:
        throw InvalidTypeException(
          'Failed to create OpenAI instance due to invalid generic type <T>',
        );
    }
  }
}
