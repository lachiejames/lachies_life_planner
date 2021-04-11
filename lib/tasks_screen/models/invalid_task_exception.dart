import 'package:flutter/material.dart';

@immutable
class InvalidTaskException implements Exception {
  final Map<String, dynamic> taskJson;

  InvalidTaskException(this.taskJson);

  @override
  String toString() {
    return 'InvalidTaskException(Tried to parse Task($taskJson))';
  }
}
