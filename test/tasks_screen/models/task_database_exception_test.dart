import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/tasks_screen/models/task_database_exception.dart';

import '../../utils/mock_firestore_data.dart';

void main() {
  group('TaskDBException', () {
    test('logs correct string', () {
      TaskDBException error;

      try {
        throw TaskDBException('ERROR: could not delete $mockTask from FireStore');
      } catch (e) {
        error = e;
      }

      expect(
        error.toString(),
        'TaskDBException:(ERROR: could not delete Task({id: 1234567890, name: test task, dateCreated: Timestamp(seconds=12345, nanoseconds=67890), isComplete: false} from FireStore)',
      );
    });
  });
}
