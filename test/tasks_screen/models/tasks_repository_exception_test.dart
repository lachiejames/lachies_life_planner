import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/tasks_screen/models/tasks_repository_exception.dart';

import '../../utils/mock_firestore_data.dart';

void main() {
  group('TasksRepositoryException', () {
    test('logs correct string', () {
      TasksRepositoryException error;

      try {
        throw TasksRepositoryException('ERROR: could not delete $mockTask from FireStore');
      } catch (e) {
        error = e;
      }

      expect(
        error.toString(),
        'TasksRepositoryException:(ERROR: could not delete Task({id: 1234567890, name: test task, dateCreated: Timestamp(seconds=12345, nanoseconds=67890), isComplete: false} from FireStore)',
      );
    });
  });
}
