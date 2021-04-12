import 'package:flutter/material.dart';

@immutable
class AssignmentsRepositoryException implements Exception {
  final String message;

  const AssignmentsRepositoryException(this.message);

  @override
  String toString() {
    return 'AssignmentsRepositoryException:($message)';
  }
}
