class TaskDBException implements Exception {
  final String message;

  TaskDBException(this.message);

  @override
  String toString() {
    return 'TaskDBException:($message)';
  }
}
