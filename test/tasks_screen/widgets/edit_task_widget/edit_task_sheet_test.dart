import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/shared/config/firebase_config.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';
import 'package:lachies_life_planner/tasks_screen/models/task_database_operations.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/edit_task_widget/edit_task_sheet.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/edit_task_widget/edit_task_text_field.dart';

import '../../../utils/device_screen_sizes.dart';
import '../../../utils/mock_firestore_data.dart';
import '../../../utils/widget_tester.dart';

void main() {
  Future<void> initEditTaskSheet(WidgetTester tester, {@required Task task, Size size = samsungGalaxyNote5}) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: WidgetTestingWrapper(
            screenSize: size,
            widget: EditTaskSheet(
              task: task,
            ),
          ),
        ),
      ),
    );
  }

  group('EditTaskSheet', () {
    setUp(() async {
      setFirestoreInstance(MockFirestoreInstance());
      await addTask(mockTask);
    });

    testWidgets('shows correct text when task is null', (WidgetTester tester) async {
      await initEditTaskSheet(tester, task: null);

      expect(find.text('Add'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
    });

    testWidgets('shows correct text when task is NOT null', (WidgetTester tester) async {
      await initEditTaskSheet(tester, task: mockTask);

      expect(find.text('Update'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
    });

    testWidgets('works on all screen sizes', (WidgetTester tester) async {
      for (Size size in allDeviceSizes) {
        await initEditTaskSheet(tester, task: mockTask, size: size);
      }
    });

    testWidgets('entering text then tapping "Add" adds a task to firestore', (WidgetTester tester) async {
      await initEditTaskSheet(tester, task: null);
      await tester.enterText(find.byType(EditTaskTextField), 'test task');
      await tester.tap(find.text('Add'));

      Task newTask = (await getAllTasks())[0];
      expect(newTask.name, 'test task');
      expect(newTask.isComplete, false);

      // These are randomly generated, so cannot test with an explicit value
      expect(newTask.dateCreated, isNotNull);
      expect(newTask.id, isNotNull);
    });

    testWidgets('tapping "Add" closes the sheet', (WidgetTester tester) async {
      await initEditTaskSheet(tester, task: null);
      await tester.tap(find.text('Add'));
      await tester.pumpAndSettle();
      expect(find.byType(EditTaskSheet), findsNothing);
    });

    testWidgets('entering text then tapping "Update" updates a task within firestore', (WidgetTester tester) async {
      await initEditTaskSheet(tester, task: mockTask);
      await tester.enterText(find.byType(EditTaskTextField), 'test task');
      await tester.tap(find.text('Update'));

      String firestoreDump = (getFirestoreInstance() as MockFirestoreInstance).dump();
      expect(firestoreDump.contains('"name": "test task"'), true);
    });

    testWidgets('tapping "Update" closes the sheet', (WidgetTester tester) async {
      await initEditTaskSheet(tester, task: mockTask);
      await tester.tap(find.text('Update'));
      await tester.pumpAndSettle();
      expect(find.byType(EditTaskSheet), findsNothing);
    });

    testWidgets('tapping "Cancel" closes the sheet', (WidgetTester tester) async {
      await initEditTaskSheet(tester, task: mockTask);
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();
      expect(find.byType(EditTaskSheet), findsNothing);
    });
  });
}
