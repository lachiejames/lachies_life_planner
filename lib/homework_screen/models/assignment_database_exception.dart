class AssignmentDBException implements Exception {
  final String message;

  AssignmentDBException(this.message);

  @override
  String toString() {
    return 'AssignmentDBException:($message)';
  }
}
