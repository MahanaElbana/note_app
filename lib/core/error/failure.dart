abstract class Failure {
  final String message;
  const Failure({required this.message});
}

class FirebaseFailure extends Failure {
  const FirebaseFailure({required super.message});
}

class DatabaseFailure extends Failure {
  const DatabaseFailure({required super.message});
}
