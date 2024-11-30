class Failure {
  final String message;
  final Exception? exception;

  Failure(this.message, [this.exception]);

  @override
  String toString() => exception == null ? message : '$message: $exception';
}
