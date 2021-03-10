class InvalidTaskException implements Exception {
  final Map<String, dynamic> taskJson;

  InvalidTaskException(this.taskJson);

  @override
  String toString() {
    return 'InvalidTaskException(Tried to pass Task($taskJson))';
  }
}
