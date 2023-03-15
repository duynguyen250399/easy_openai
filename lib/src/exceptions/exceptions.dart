abstract class OpenAIException implements Exception {
  final String message;
  OpenAIException(this.message);
}

class InvalidAPIKeyException extends OpenAIException {
  InvalidAPIKeyException() : super('Invalid OpenAI API secret key.');
}

class InvalidTypeException extends OpenAIException {
  InvalidTypeException(super.message);
}
