import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/shared/widgets/sheet_text_button.dart';

import '../../utils/device_screen_sizes.dart';
import '../../utils/widget_pumper.dart';

void main() {
  group('SheetTextButton', () {
    testWidgets('displays correct text and icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        WidgetTestingWrapper(
          widget: SheetTextButton(
            text: 'test',
            onPressed: () {},
          ),
        ),
      );

      expect(find.text('test'), findsOneWidget);
    });

    testWidgets('works on all screen sizes', (WidgetTester tester) async {
      for (Size size in allDeviceSizes) {
        await tester.pumpWidget(
          WidgetTestingWrapper(
            screenSize: size,
            widget: SheetTextButton(
              text: 'test',
              onPressed: () {},
            ),
          ),
        );
      }
    });
  });
}
