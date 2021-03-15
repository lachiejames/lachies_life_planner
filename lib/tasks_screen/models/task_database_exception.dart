class TaskDBException implements Exception {
  final String message;
  final dynamic errorObject;

  TaskDBException(this.message, this.errorObject);

  @override
  String toString() {
    return 'TaskDBException: $message\n$errorObject';
  }
}
