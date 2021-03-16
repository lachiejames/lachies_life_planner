import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/task_widget.dart';

import '../../utils/device_screen_sizes.dart';
import '../../utils/mock_firestore_data.dart';
import '../../utils/widget_pumper.dart';

void main() {
  group('TaskWidget', () {
    testWidgets('displays correct text and icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: WidgetTestingWrapper(
              widget: TaskWidget(
                task: mockTask,
              ),
            ),
          ),
        ),
      );

      expect(find.text(mockTask.name), findsOneWidget);
      expect(find.byType(Checkbox), findsOneWidget);
    });

    testWidgets('works on all screen sizes', (WidgetTester tester) async {
      for (Size size in allDeviceSizes) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: WidgetTestingWrapper(
                screenSize: size,
                widget: TaskWidget(
                  task: mockTask,
                ),
              ),
            ),
          ),
        );
      }
    });
  });
}
