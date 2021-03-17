import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/edit_task_widget/edit_task_update_button.dart';

import '../../../utils/device_screen_sizes.dart';
import '../../../utils/mock_firestore_data.dart';
import '../../../utils/widget_pumper.dart';

void main() {
  group('EditTaskUpdateButton', () {
    testWidgets('displays "Update"', (WidgetTester tester) async {
      await tester.pumpWidget(
        WidgetTestingWrapper(
          widget: EditTaskUpdateButton(
            taskEditingController: TextEditingController.fromValue(
              TextEditingValue(text: 'test'),
            ),
            taskToUpdate: mockTask,
          ),
        ),
      );

      expect(find.text('Update'), findsOneWidget);
    });

    testWidgets('works on all screen sizes', (WidgetTester tester) async {
      for (Size size in allDeviceSizes) {
        await tester.pumpWidget(
          WidgetTestingWrapper(
            screenSize: size,
            widget: EditTaskUpdateButton(
              taskEditingController: TextEditingController.fromValue(
                TextEditingValue(text: 'test'),
              ),
              taskToUpdate: mockTask,
            ),
          ),
        );
      }
    });
  });
}