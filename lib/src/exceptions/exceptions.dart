abstract class OpenAIException implements Exception {
  final String message;
  OpenAIException(this.message);
}

class InvalidAPIKeyException extends OpenAIException {
  InvalidAPIKeyException() : super('Invalid OpenAI API secret key.');
}

class UnInitializedException extends OpenAIException {
  UnInitializedException()
      : super(
            'You must call [OpenAI.init] method first to initialize OpenAI API configuration.');
}
