import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/shared/config/firebase_config.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';
import 'package:lachies_life_planner/tasks_screen/models/task_database_operations.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/task_list_view.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/task_widget.dart';

import '../../utils/device_screen_sizes.dart';
import '../../utils/mock_firestore_data.dart';
import '../../utils/widget_pumper.dart';

void main() {
  Future<void> initTaskListView(WidgetTester tester, [Size size = samsungGalaxyNote5]) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: WidgetTestingWrapper(
              screenSize: size,
              widget: TaskListView(),
            ),
          ),
        ),
      );
    });
  }

  group('TaskListView', () {
    setUp(() {
      setFirestoreInstance(MockFirestoreInstance());
    });

    testWidgets('displays correct text and icon', (WidgetTester tester) async {
      await initTaskListView(tester);
    });

    testWidgets('works on all screen sizes', (WidgetTester tester) async {
      for (Size size in allDeviceSizes) {
        await initTaskListView(tester, size);
      }
    });

    testWidgets('initially shows CircularProgressIndicator', (WidgetTester tester) async {
      await initTaskListView(tester);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('displays all task widgets in Firestore', (WidgetTester tester) async {
      await initTaskListView(tester);

      await tester.runAsync(() async {
        for (Task task in mockTaskList) {
          await addTask(task);
        }
        await tester.idle();
        await tester.pump();
        expect(find.byType(TaskWidget), findsNWidgets(10));
      });
    });
  });
}
