import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/shared/config/firebase_config.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/task_list_view.dart';

import '../../utils/device_screen_sizes.dart';
import '../../utils/widget_pumper.dart';

void main() {
  group('TaskListView', () {
    setUp(() {
      setFirestoreInstance(MockFirestoreInstance());
    });

    testWidgets('displays correct text and icon', (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(
          WidgetTestingWrapper(
            widget: TaskListView(),
          ),
        );
      });
    });

    testWidgets('works on all screen sizes', (WidgetTester tester) async {
      for (Size size in allDeviceSizes) {
        await tester.runAsync(() async {
          await tester.pumpWidget(
            WidgetTestingWrapper(
              widget: TaskListView(),
            ),
          );
        });
      }
    });
  });
}
