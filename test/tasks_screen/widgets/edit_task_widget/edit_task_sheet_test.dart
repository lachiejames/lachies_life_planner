import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/edit_task_widget/edit_task_sheet.dart';

import '../../../utils/device_screen_sizes.dart';
import '../../../utils/mock_firestore_data.dart';
import '../../../utils/widget_pumper.dart';

void main() {
  group('EditTaskSheet', () {
    testWidgets('shows correct text when task is null', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: WidgetTestingWrapper(
              widget: EditTaskSheet(
                task: null,
              ),
            ),
          ),
        ),
      );

      expect(find.text('Add'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
    });

    testWidgets('shows correct text when task is NOT null', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: WidgetTestingWrapper(
              widget: EditTaskSheet(
                task: mockTask,
              ),
            ),
          ),
        ),
      );

      expect(find.text('Update'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
    });

    testWidgets('works on all screen sizes', (WidgetTester tester) async {
      for (Size size in allDeviceSizes) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: WidgetTestingWrapper(
                screenSize: size,
                widget: EditTaskSheet(
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
