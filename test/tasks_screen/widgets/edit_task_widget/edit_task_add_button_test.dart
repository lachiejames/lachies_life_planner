import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/edit_task_widget/edit_task_add_button.dart';

import '../../../utils/device_screen_sizes.dart';
import '../../../utils/widget_pumper.dart';

void main() {
  group('EditTaskAddButton', () {
    testWidgets('displays "Add"', (WidgetTester tester) async {
      await tester.pumpWidget(
        WidgetTestingWrapper(
          widget: EditTaskAddButton(
            taskEditingController: TextEditingController.fromValue(
              TextEditingValue(text: 'test'),
            ),
          ),
        ),
      );

      expect(find.text('Add'), findsOneWidget);
    });

    testWidgets('works on all screen sizes', (WidgetTester tester) async {
      for (Size size in allDeviceSizes) {
        await tester.pumpWidget(
          WidgetTestingWrapper(
            screenSize: size,
            widget: EditTaskAddButton(
              taskEditingController: TextEditingController.fromValue(
                TextEditingValue(text: 'test'),
              ),
            ),
          ),
        );
      }
    });
  });
}
