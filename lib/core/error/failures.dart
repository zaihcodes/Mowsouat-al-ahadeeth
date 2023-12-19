abstract class Failure {
  String get message;
}

class EmptyDataFailure extends Failure {
  @override
  final String message;

  EmptyDataFailure({required this.message});

  @override
  String toString() => 'EmptyDataFailure: $message';
}

class ServerFailure extends Failure {
  @override
  final String message;

  ServerFailure({required this.message});

  @override
  String toString() => 'ServerFailure: $message';
}

class OfflineFailure extends Failure {
  @override
  final String message;

  OfflineFailure({required this.message});

  @override
  String toString() => 'OfflineFailure: $message';
}
