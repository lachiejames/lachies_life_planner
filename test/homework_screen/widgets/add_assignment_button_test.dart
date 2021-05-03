import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/homework_screen/widgets/add_assignment_button.dart';
import 'package:lachies_life_planner/homework_screen/widgets/edit_assignment_widget/edit_assignment_sheet.dart';

import '../../utils/device_screen_sizes.dart';
import '../../utils/widget_tester.dart';

void main() {
  Future<void> initAddAssignmentButton(WidgetTester tester, [Size size = samsungGalaxyNote5]) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: WidgetTestingWrapper(
            screenSize: size,
            widget: const AddAssignmentButton(),
          ),
        ),
      ),
    );
  }

  group('AddAssignmentButton', () {
    testWidgets('displays correct icon', (WidgetTester tester) async {
      await initAddAssignmentButton(tester);

      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('works on all screen sizes', (WidgetTester tester) async {
      for (Size size in allDeviceSizes) {
        await initAddAssignmentButton(tester, size);
      }
    });

    testWidgets('tapping it brings up bottom sheet', (WidgetTester tester) async {
      await initAddAssignmentButton(tester);
      await tap(tester, find.byIcon(Icons.add));

      expect(find.byType(EditAssignmentSheet), findsOneWidget);
    });
  });
}
