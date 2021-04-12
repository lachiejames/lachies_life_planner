import 'package:flutter/material.dart';

@immutable
class TasksRepositoryException implements Exception {
  final String message;

  const TasksRepositoryException(this.message);

  @override
  String toString() {
    return 'TasksRepositoryException:($message)';
  }
}
