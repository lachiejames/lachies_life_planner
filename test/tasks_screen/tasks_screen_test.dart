import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/shared/firebase_config.dart';
import 'package:lachies_life_planner/tasks_screen/models/task_database_operations.dart';
import 'package:lachies_life_planner/tasks_screen/tasks_screen.dart';

import '../utils/device_screen_sizes.dart';
import '../utils/mock_firestore_data.dart';
import '../utils/widget_pumper.dart';

void main() {
  setUp(() {
    setFirestoreInstance(MockFirestoreInstance());
    addTask(mockTask);
  });

  testWidgets('works on all screen sizes', (WidgetTester tester) async {
    // Required for tests involving Streams https://github.com/flutter/flutter/issues/17738#issuecomment-392237064
    await tester.runAsync(() async {
      for (Size size in allDeviceSizes) {
        await tester.pumpWidget(
          ScreenTestingWrapper(screenSize: size, screen: TasksScreen()),
        );
      }
    });
  });
}
