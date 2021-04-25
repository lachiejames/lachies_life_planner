import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/homework_screen/widgets/edit_assignment_widget/edit_assignment_add_button.dart';

import '../../../utils/device_screen_sizes.dart';
import '../../../utils/widget_tester.dart';

void main() {
  Future<void> initEditAssignmentAddButton(WidgetTester tester, [Size size = samsungGalaxyNote5]) async {
    await tester.pumpWidget(
      WidgetTestingWrapper(
        screenSize: size,
        widget: EditAssignmentAddButton(
          formKey: GlobalKey<FormState>(),
          assignmentEditingController: TextEditingController.fromValue(
            const TextEditingValue(text: 'test'),
          ),
        ),
      ),
    );
  }

  group('EditAssignmentAddButton', () {
    testWidgets('displays "Add"', (WidgetTester tester) async {
      await initEditAssignmentAddButton(tester);
      expect(find.text('Add'), findsOneWidget);
    });

    testWidgets('works on all screen sizes', (WidgetTester tester) async {
      for (Size size in allDeviceSizes) {
        await initEditAssignmentAddButton(tester, size);
      }
    });
  });
}
