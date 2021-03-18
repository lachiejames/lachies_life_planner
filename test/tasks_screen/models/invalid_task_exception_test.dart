import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/tasks_screen/models/invalid_task_exception.dart';

import '../../utils/mock_firestore_data.dart';

void main() {
  group('InvalidTaskException', () {
    test('logs correct string', () {
      InvalidTaskException error;

      try {
        throw InvalidTaskException(mockTask.toJson());
      } catch (e) {
        error = e;
      }

      expect(
        error.toString(),
        'InvalidTaskException(Tried to parse Task({id: 1234567890, name: test task, dateCreated: Timestamp(seconds=12345, nanoseconds=67890), isComplete: false}))',
      );
    });
  });
}
