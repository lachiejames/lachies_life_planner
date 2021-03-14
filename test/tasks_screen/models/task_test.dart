import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/tasks_screen/models/invalid_task_exception.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';

import '../../utils/mock_firestore_data.dart';

void main() {
  group('Task', () {
    test('toString() returns correct string', () async {
      expect(
        mockTask.toString(),
        'Task({id: 1234567890, name: test task, dateCreated: Timestamp(seconds=12345, nanoseconds=67890), isComplete: false}',
      );
    });

    test('toJSON() returns correct JSON object', () async {
      expect(mockTask.toJson(), <String, dynamic>{
        'id': '1234567890',
        'dateCreated': Timestamp(12345, 67890),
        'name': 'test task',
        'isComplete': false,
      });
    });

    group('fromJson()', () {
      test('when task is correctly formatted with correct types, returns Task object', () async {
        Map<String, dynamic> jsonTask = {
          'id': '1234567890',
          'dateCreated': Timestamp(12345, 67890),
          'name': 'test task',
          'isComplete': false,
        };
        Task parsedTask = Task.fromJson(jsonTask);

        expect(parsedTask.toString(), mockTask.toString());
      });

      test('should throw InvalidTaskException when incorrectly formatted task is passed', () async {
        Map<String, dynamic> invalidJsonTask = {
          'id': '1234567890',
          'dateCreatd': Timestamp(12345, 67890),
          'naame': 'test task',
          'isComplet2e': false,
        };

        try {
          Task.fromJson(invalidJsonTask);
        } catch (e) {
          expect(e, isA<InvalidTaskException>());
        }
      });

      test('should throw InvalidTaskException when incorrect types are passed', () async {
        Map<String, dynamic> invalidJsonTask = {
          'id': 1234567890,
          'dateCreated': DateTime.now(),
          'name': 'test task',
          'isComplete': 5,
        };

        try {
          Task.fromJson(invalidJsonTask);
        } catch (e) {
          expect(e, isA<InvalidTaskException>());
        }
      });
    });

    test('copyWith() returns new Task with values modified', () async {
      Task taskCopy = mockTask.copyWith(isComplete: true, name: 'new task name');

      expect(taskCopy.toJson(), {
        'id': '1234567890',
        'dateCreated': Timestamp(12345, 67890),
        'name': 'new task name',
        'isComplete': true,
      });
    });
  });
}
