abstract class AppException implements Exception {
  final String message;

  AppException(this.message);

  @override
  String toString() => 'AppException: $message';
}

class EmptyDataException extends AppException {
  EmptyDataException(String message) : super(message);
}

class ServerException extends AppException {
  ServerException(String message) : super(message);
}

class OfflineException extends AppException {
  OfflineException(String message) : super(message);
}
