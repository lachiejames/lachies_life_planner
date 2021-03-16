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
    });

    group('addTask()', () {
      test('adds task to Firestore', () async {
        addTask(mockTask);

        DocumentSnapshot dbData = await getTaskCollection().doc(mockTask.id).get();
        expect(dbData.data(), mockTask.toJson());
      });

      test('can be used multiple times', () async {
        for (Task task in mockTaskList) {
          addTask(task);

          DocumentSnapshot dbData = await getTaskCollection().doc(task.id).get();
          expect(dbData.data(), task.toJson());
        }
      });
    });

    group('updateTask()', () {
      test('updates task in Firestore', () async {
        addTask(mockTask);
        updateTask(mockTask.copyWith(name: 'new task name'));

        DocumentSnapshot dbData = await getTaskCollection().doc(mockTask.id).get();
        expect(dbData.data(), {
          'id': '1234567890',
          'dateCreated': Timestamp(12345, 67890),
          'name': 'new task name',
          'isComplete': false,
        });
      });
    });

    group('removeTask()', () {
      test('removes task from Firestore', () async {
        addTask(mockTask);
        deleteTask(mockTask);

        DocumentSnapshot dbData = await getTaskCollection().doc(mockTask.id).get();
        expect(dbData.data(), null);
      });
    });
  });
}
