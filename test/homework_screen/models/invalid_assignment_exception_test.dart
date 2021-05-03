import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/homework_screen/models/invalid_assignment_exception.dart';

import '../../utils/mock_firestore_data.dart';

void main() {
  group('InvalidAssignmentException', () {
    test('logs correct string', () {
      InvalidAssignmentException error;

      try {
        throw InvalidAssignmentException(Exception(), mockAssignment.toJson());
      } catch (e) {
        error = e;
      }

      expect(
        error.toString(),
        'InvalidAssignmentException(Tried to parse Assignment({id: 1234567890, dateCreated: 2025-03-11 11:02:00.000, title: Assignment 1, subject: Science, dueDate: 2025-03-14 11:02:00.000, priority: Low, isComplete: false})), Exception',
      );
    });
  });
}
