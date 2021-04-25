import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/homework_screen/widgets/edit_assignment_widget/edit_assignment_cancel_button.dart';

import '../../../utils/device_screen_sizes.dart';
import '../../../utils/widget_tester.dart';

void main() {
  Future<void> initEditAssignmentCancelButton(WidgetTester tester, [Size size = samsungGalaxyNote5]) async {
    await tester.pumpWidget(
      WidgetTestingWrapper(
        screenSize: size,
        widget: const EditAssignmentCancelButton(),
      ),
    );
  }

  group('EditAssignmentCancelButton', () {
    testWidgets('displays "Cancel"', (WidgetTester tester) async {
      await initEditAssignmentCancelButton(tester);
      expect(find.text('Cancel'), findsOneWidget);
    });

    testWidgets('works on all screen sizes', (WidgetTester tester) async {
      for (Size size in allDeviceSizes) {
        await initEditAssignmentCancelButton(tester, size);
      }
    });
  });
}