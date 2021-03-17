import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/home_screen/widgets/text_icon_button.dart';

import '../../utils/device_screen_sizes.dart';
import '../../utils/widget_pumper.dart';

void main() {
  Future<void> initTextIconButton(WidgetTester tester, [Size size = samsungGalaxyNote5]) async {
    await tester.pumpWidget(
      WidgetTestingWrapper(
        screenSize: size,
        widget: TextIconButton(
          onPressed: null,
          text: 'Tasks',
          icon: Icons.check,
        ),
      ),
    );
  }

  group('TextIconButton', () {
    testWidgets('displays correct text and icon', (WidgetTester tester) async {
      await initTextIconButton(tester);

      expect(find.byIcon(Icons.check), findsOneWidget);
      expect(find.text('Tasks'), findsOneWidget);
    });

    testWidgets('works on all device sizes', (WidgetTester tester) async {
      for (Size size in allDeviceSizes) {
        await initTextIconButton(tester, size);
      }
    });
  });
}
