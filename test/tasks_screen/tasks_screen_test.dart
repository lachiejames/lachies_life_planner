import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/shared/config/firebase_config.dart';
import 'package:lachies_life_planner/shared/widgets/app_bar_overflow_menu.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';
import 'package:lachies_life_planner/tasks_screen/models/task_database_operations.dart';
import 'package:lachies_life_planner/tasks_screen/tasks_screen.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/task_widget.dart';

import '../utils/device_screen_sizes.dart';
import '../utils/mock_firestore_data.dart';
import '../utils/widget_pumper.dart';

void main() {
  Future<void> initTasksScreen(WidgetTester tester, [Size size = samsungGalaxyNote5]) async {
    // Required for tests involving Streams https://github.com/flutter/flutter/issues/17738#issuecomment-392237064
    await tester.runAsync(() async {
      await tester.pumpWidget(
        ScreenTestingWrapper(
          screenSize: size,
          screen: TasksScreen(),
        ),
      );
    });
  }

  Future<void> longPumpUntilSettle(WidgetTester tester) async {
    await tester.pump();
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
  }

  Future<void> populateTaskWidgets(WidgetTester tester) async {
    await tester.runAsync(() async {
      for (Task task in mockTaskList) {
        await addTask(task);
      }
      await tester.idle();
      await tester.pump();
    });
  }

  group('TasksScreen', () {
    setUp(() {
      setFirestoreInstance(MockFirestoreInstance());
    });

    testWidgets('works on all screen sizes', (WidgetTester tester) async {
      for (Size size in allDeviceSizes) {
        await initTasksScreen(tester, size);
      }
    });

    testWidgets('displays all TaskWidgets', (WidgetTester tester) async {
      await initTasksScreen(tester);
      await populateTaskWidgets(tester);

      // Need to add "skipOffstage: false" to find off-screen TaskWidgets
      expect(find.byType(TaskWidget, skipOffstage: false), findsNWidgets(10));
    });

    group('overflow menu', () {
      testWidgets('displays menu items when tapped', (WidgetTester tester) async {
        await initTasksScreen(tester);
        await longPumpUntilSettle(tester);

        await tester.tap(find.byType(AppBarOverflowMenu));
        await longPumpUntilSettle(tester);

        expect(find.text('Delete All Tasks'), findsOneWidget);
      });

      testWidgets('tapping "Delete All Tasks" will remove all TaskWidgets', (WidgetTester tester) async {
        await initTasksScreen(tester);
        await populateTaskWidgets(tester);

        await tester.runAsync(() async {
          await tester.tap(find.byType(AppBarOverflowMenu));
          await longPumpUntilSettle(tester);
          await tester.tap(find.text('Delete All Tasks'));
          await longPumpUntilSettle(tester);
          await longPumpUntilSettle(tester);
        });

        // Currently not working, but this seems to be due to a bug in flutter_test
        // https://github.com/flutter/flutter/issues/78832
        await initTasksScreen(tester);

        expect(find.byType(TaskWidget), findsNothing);

        // Tasks get deleted from DB, but does not seem to get updated on page
      });

      testWidgets('collapses after tapping off', (WidgetTester tester) async {
        await initTasksScreen(tester);

        await tester.runAsync(() async {
          expect(find.text('Delete All Tasks'), findsNothing);

          await tester.tap(find.byType(AppBarOverflowMenu));
          await longPumpUntilSettle(tester);

          expect(find.text('Delete All Tasks'), findsOneWidget);

          await tester.tapAt(Offset.zero);
          await longPumpUntilSettle(tester);

          expect(find.text('Delete All Tasks'), findsNothing);
        });
      });
    });
  });
}
