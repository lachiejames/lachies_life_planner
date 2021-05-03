import 'package:flutter/material.dart';

@immutable
class InvalidAssignmentException implements Exception {
  final dynamic error;
  final Map<String, dynamic> assignmentJson;

  const InvalidAssignmentException(this.error, this.assignmentJson);

  @override
  String toString() {
    return 'InvalidAssignmentException(Tried to parse Assignment($assignmentJson)), $error';
  }
}
