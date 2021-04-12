import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/homework_screen/models/assignments_repository_exception.dart';

import '../../utils/mock_firestore_data.dart';

void main() {
  group('AssignmentsRepositoryException', () {
    test('logs correct string', () {
      AssignmentsRepositoryException error;

      try {
        throw AssignmentsRepositoryException('ERROR: could not delete $mockAssignment from FireStore');
      } catch (e) {
        error = e;
      }

      expect(
        error.toString(),
        'AssignmentsRepositoryException:(ERROR: could not delete Assignment({id: 1234567890, dateCreated: Timestamp(seconds=12345, nanoseconds=67890), title: Assignment 1, subject: Science, dueDate: Timestamp(seconds=123456, nanoseconds=0), priority: Low, isComplete: false} from FireStore)',
      );
    });
  });
}
