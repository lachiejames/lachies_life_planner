import 'package:flutter/material.dart';

@immutable
class InvalidAssignmentException implements Exception {
  final Map<String, dynamic> assignmentJson;

  InvalidAssignmentException(this.assignmentJson);

  @override
  String toString() {
    return 'InvalidAssignmentException(Tried to parse Assignment($assignmentJson))';
  }
}
