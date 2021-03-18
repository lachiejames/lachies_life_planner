import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/shared/config/firebase_config.dart';
import 'package:lachies_life_planner/tasks_screen/models/task_database_operations.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';

import '../../utils/mock_firestore_data.dart';

void main() {
  group('Task DB Operations', () {
    setUp(() {
      setFirestoreInstance(MockFirestoreInstance());
    });

    test('addTask() adds task to Firestore', () async {
      await addTask(mockTask);
      expect((await getTaskByID(mockTask.id)).toJson(), mockTask.toJson());
    });

    test('addTask() can be used multiple times', () async {
      for (Task task in mockTaskList) {
        await addTask(task);
        expect((await getTaskByID(task.id)).toJson(), task.toJson());
      }
    });

    test('getTaskByID() returns a task it exists', () async {
      await addTask(mockTask);
      expect((await getTaskByID(mockTask.id)).toJson(), mockTask.toJson());
    });

    test('getTaskByID() throws an error when the task does not exist', () async {
      expect(() async => await getTaskByID(mockTask.id), throwsA(isA<NoSuchMethodError>()));
    });

    test('updateTask() updates task in Firestore', () async {
      await addTask(mockTask);
      await updateTask(mockTask.copyWith(name: 'new task name'));

      expect((await getTaskByID(mockTask.id)).toJson(), {
        'id': '1234567890',
        'dateCreated': Timestamp(12345, 67890),
        'name': 'new task name',
        'isComplete': false,
      });
    });

    test('updateTask() throws an error when task does not exist', () async {
      expect(() async => await updateTask(mockTask.copyWith(name: 'new task name')), throwsA(isA<NoSuchMethodError>()));
    });

    test('deleteTask() removes task from Firestore', () async {
      await addTask(mockTask);
      await deleteTask(mockTask);

      expect(() async => await getTaskByID(mockTask.id), throwsA(isA<NoSuchMethodError>()));
    });

    test('getAllTasks() returns all tasks from Firestore', () async {
      for (Task task in mockTaskList) {
        await addTask(task);
      }

      List<Task> tasks = await getAllTasks();
      expect(tasks.length, 10);

      for (int i = 0; i < 10; i++) {
        expect(tasks[i].toJson(), mockTaskList[i].toJson());
      }
    });

    test('deleteAllTasks() removes all tasks from Firestore', () async {
      for (Task task in mockTaskList) {
        await addTask(task);
      }

      await deleteAllTasks();

      for (Task task in mockTaskList) {
        expect(() async => await getTaskByID(task.id), throwsA(isA<NoSuchMethodError>()));
      }
    });
  });
}
