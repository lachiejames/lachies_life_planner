import 'package:flutter/material.dart';

@immutable
class AssignmentDBException implements Exception {
  final String message;

  const AssignmentDBException(this.message);

  @override
  String toString() {
    return 'AssignmentDBException:($message)';
  }
}
