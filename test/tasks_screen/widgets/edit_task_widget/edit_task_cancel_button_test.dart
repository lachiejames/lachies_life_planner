import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/edit_task_widget/edit_task_cancel_button.dart';

import '../../../utils/device_screen_sizes.dart';
import '../../../utils/widget_pumper.dart';

void main() {
  group('EditTaskCancelButton', () {
    testWidgets('displays "Cancel"', (WidgetTester tester) async {
      await tester.pumpWidget(
        WidgetTestingWrapper(
          widget: EditTaskCancelButton(),
        ),
      );

      expect(find.text('Cancel'), findsOneWidget);
    });

    testWidgets('works on all screen sizes', (WidgetTester tester) async {
      for (Size size in allDeviceSizes) {
        await tester.pumpWidget(
          WidgetTestingWrapper(
            screenSize: size,
            widget: EditTaskCancelButton(),
          ),
        );
      }
    });
  });
}
