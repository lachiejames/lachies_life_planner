import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/tasks_screen/models/invalid_task_exception.dart';

import '../../utils/mock_firestore_data.dart';

void main() {
  group('TaskDBException', () {
    test('logs correct string', () {
      try {
        throw InvalidTaskException(mockTask.toJson());
      } catch (e) {
        expect(
          e.toString(),
          'InvalidTaskException(Tried to parse Task({id: 1234567890, name: test task, dateCreated: Timestamp(seconds=12345, nanoseconds=67890), isComplete: false}))',
        );
      }
    });
  });
}
