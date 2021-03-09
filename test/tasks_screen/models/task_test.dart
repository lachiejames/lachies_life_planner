import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
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

    test('fromJson() can parse a task correctly', () async {
      expect(Task.fromJson(task.toJson()).toJson(), <String, dynamic>{
        'id': '1234567890',
        'dateCreated': Timestamp(12345, 67890),
        'name': 'test task',
        'isComplete': false,
      });
    });
  });
}
