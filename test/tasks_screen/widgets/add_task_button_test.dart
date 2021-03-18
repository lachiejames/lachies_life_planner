import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/add_task_button.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/edit_task_widget/edit_task_sheet.dart';

import '../../utils/device_screen_sizes.dart';
import '../../utils/widget_pumper.dart';

void main() {
  Future<void> initAddTaskButton(WidgetTester tester, [Size size = samsungGalaxyNote5]) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: WidgetTestingWrapper(
            screenSize: size,
            widget: AddTaskButton(),
          ),
        ),
      ),
    );
  }

  group('AddTaskButton', () {
    testWidgets('displays correct icon', (WidgetTester tester) async {
      await initAddTaskButton(tester);

      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('works on all screen sizes', (WidgetTester tester) async {
      for (Size size in allDeviceSizes) {
        await initAddTaskButton(tester, size);
      }
    });

    testWidgets('tapping it brings up bottom sheet', (WidgetTester tester) async {
      await initAddTaskButton(tester);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      expect(find.byType(EditTaskSheet), findsOneWidget);
    });
  });
}
