import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/tasks_screen/models/invalid_task_exception.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';

void main() {
  group('Task', () {
    Task task;

    setUp(() {
      task = Task(
        id: '1234567890',
        dateCreated: Timestamp(12345, 67890),
        name: 'test task',
        isComplete: false,
      );
    });

    test('toString() returns correct string', () async {
      expect(
        task.toString(),
        'Task({id: 1234567890, name: test task, dateCreated: Timestamp(seconds=12345, nanoseconds=67890), isComplete: false}',
      );
    });

    test('toJSON() returns correct JSON object', () async {
      expect(task.toJson(), <String, dynamic>{
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

        expect(parsedTask.toString(), task.toString());
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
      Task taskCopy = task.copyWith(isComplete: true, name: 'new task name');

      expect(taskCopy.toJson(), {
        'id': '1234567890',
        'dateCreated': Timestamp(12345, 67890),
        'name': 'new task name',
        'isComplete': true,
      });
    });
  });
}
