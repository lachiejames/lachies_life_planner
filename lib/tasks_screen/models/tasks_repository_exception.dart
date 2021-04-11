class TasksRepositoryException implements Exception {
  final String message;

  TasksRepositoryException(this.message);

  @override
  String toString() {
    return 'TasksRepositoryException:($message)';
  }
}
