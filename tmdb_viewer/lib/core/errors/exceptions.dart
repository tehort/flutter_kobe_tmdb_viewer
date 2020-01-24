class DialogException implements Exception {
  const DialogException(this.message);
  final String message;
}

class SnackBarException implements Exception {
  const SnackBarException(this.message);
  final String message;
}

class Failure implements Exception {
  const Failure(this.message);
  final String message;
}
