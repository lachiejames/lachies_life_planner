import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/homework_screen/models/invalid_assignment_exception.dart';

import '../../utils/mock_firestore_data.dart';

void main() {
  group('InvalidAssignmentException', () {
    test('logs correct string', () {
      InvalidAssignmentException error;

      try {
        throw InvalidAssignmentException(mockAssignment.toJson());
      } catch (e) {
        error = e;
      }

      expect(
        error.toString(),
        'InvalidAssignmentException(Tried to parse Assignment({id: 1234567890, dateCreated: Timestamp(seconds=12345, nanoseconds=67890), title: Assignment 1, subject: Science, dueDate: Timestamp(seconds=123456, nanoseconds=0), priority: Low, isComplete: false}))',
      );
    });
  });
}
