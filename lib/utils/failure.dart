class Failure {
  final String message;
  final int code;
  final FailureType type;
  final StackTrace? stackTrace;

  Failure(this.message, {this.type = FailureType.error, this.code = 0, this.stackTrace});

  @override
  String toString() {
    return '$message,$type';
  }
}

enum FailureType {
  network,
  io,
  http,
  database,
  error,
}
