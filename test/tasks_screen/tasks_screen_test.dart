import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/shared/config/firebase_config.dart';
import 'package:lachies_life_planner/shared/widgets/app_bar_overflow_menu.dart';
import 'package:lachies_life_planner/tasks_screen/models/task_database_operations.dart';
import 'package:lachies_life_planner/tasks_screen/tasks_screen.dart';

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

  group('TasksScreen', () {
    setUp(() {
      setFirestoreInstance(MockFirestoreInstance());
      addTask(mockTask);
    });

    testWidgets('works on all screen sizes', (WidgetTester tester) async {
      for (Size size in allDeviceSizes) {
        await initTasksScreen(tester, size);
      }
    });

    testWidgets('tapping overflow menu presents list of items', (WidgetTester tester) async {
      await initTasksScreen(tester);

      expect(find.text('Delete All Tasks'), findsNothing);

      await tester.tap(find.byType(AppBarOverflowMenu));
      await tester.idle();

      expect(find.text('Delete All Tasks'), findsOneWidget);
    });
  });
}
