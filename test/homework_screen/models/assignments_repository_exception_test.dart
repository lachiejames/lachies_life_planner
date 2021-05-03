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
        'AssignmentsRepositoryException:(ERROR: could not delete Assignment({id: 1234567890, dateCreated: 2025-03-11 11:02:00.000, title: Assignment 1, subject: Science, dueDate: 2025-03-14 11:02:00.000, priority: Low, isComplete: false} from FireStore)',
      );
    });
  });
}
