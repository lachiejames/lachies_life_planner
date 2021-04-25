import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/homework_screen/widgets/edit_assignment_widget/edit_assignment_update_button.dart';

import '../../../utils/device_screen_sizes.dart';
import '../../../utils/mock_firestore_data.dart';
import '../../../utils/widget_tester.dart';

void main() {
  Future<void> initEditAssignmentUpdateButton(WidgetTester tester, [Size size = samsungGalaxyNote5]) async {
    await tester.pumpWidget(
      WidgetTestingWrapper(
        screenSize: size,
        widget: EditAssignmentUpdateButton(
          formKey: GlobalKey<FormState>(),
          assignmentEditingController: TextEditingController.fromValue(
            const TextEditingValue(text: 'test'),
          ),
          assignmentToUpdate: mockAssignment,
        ),
      ),
    );
  }

  group('EditAssignmentUpdateButton', () {
    testWidgets('displays "Update"', (WidgetTester tester) async {
      await initEditAssignmentUpdateButton(tester);
      expect(find.text('Update'), findsOneWidget);
    });

    testWidgets('works on all screen sizes', (WidgetTester tester) async {
      for (Size size in allDeviceSizes) {
        await initEditAssignmentUpdateButton(tester, size);
      }
    });
  });
}
