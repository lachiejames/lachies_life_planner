import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/edit_task_widget/edit_task_text_field.dart';

import '../../../utils/device_screen_sizes.dart';
import '../../../utils/widget_tester.dart';

void main() {
  Future<void> initEditTaskTextField(WidgetTester tester, [Size size = samsungGalaxyNote5]) async {
    await tester.pumpWidget(
      // TextField widgets must be wrapped with MaterialApp and Scaffold
      MaterialApp(
        home: Scaffold(
          body: WidgetTestingWrapper(
            screenSize: size,
            widget: const EditTaskTextField(),
          ),
        ),
      ),
    );
  }

  group('EditTaskTextField', () {
    testWidgets('can enter text into it', (WidgetTester tester) async {
      await initEditTaskTextField(tester);

      await tester.enterText(find.byType(EditTaskTextField), 'test');
      expect(find.text('test'), findsOneWidget);
    });

    testWidgets('works on all screen sizes', (WidgetTester tester) async {
      for (Size size in allDeviceSizes) {
        await initEditTaskTextField(tester, size);
      }
    });
  });
}
