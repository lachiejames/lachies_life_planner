import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/shared/config/firebase_config.dart';
import 'package:lachies_life_planner/tasks_screen/models/task_database_operations.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';

import '../../utils/mock_firestore_data.dart';

void main() {
  group('Task', () {
    setUp(() {
      setFirestoreInstance(MockFirestoreInstance());
      addTask(mockTask);
    });

    test('addTask() adds task to Firestore', () async {
      DocumentSnapshot dbData = await getTaskCollection().doc(mockTask.id).get();
      expect(dbData.data(), mockTask.toJson());
    });

    test('addTask() can be used multiple times', () async {
      for (Task task in mockTaskList) {
        addTask(task);

        DocumentSnapshot dbData = await getTaskCollection().doc(task.id).get();
        expect(dbData.data(), task.toJson());
      }
    });

    test('updateTask() updates task in Firestore', () async {
      updateTask(mockTask.copyWith(name: 'new task name'));

      DocumentSnapshot dbData = await getTaskCollection().doc(mockTask.id).get();
      expect(dbData.data(), {
        'id': '1234567890',
        'dateCreated': Timestamp(12345, 67890),
        'name': 'new task name',
        'isComplete': false,
      });
    });

    test('deleteTask() removes task from Firestore', () async {
      deleteTask(mockTask);

      DocumentSnapshot dbData = await getTaskCollection().doc(mockTask.id).get();
      expect(dbData.data(), null);
    });

    test('deleteAllTasks() removes all tasks from Firestore', () async {
      for (Task task in mockTaskList) {
        addTask(task);
      }

      await deleteAllTasks();

      for (Task task in mockTaskList) {
        DocumentSnapshot dbData = await getTaskCollection().doc(task.id).get();
        expect(dbData.data(), null);
      }
    });
  });
}
