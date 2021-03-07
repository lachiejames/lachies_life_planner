import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/home_screen/widgets/text_icon_button.dart';
import 'package:lachies_life_planner/shared/size_config.dart';

import '../../utils/device_screen_sizes.dart';

void main() {
  setUp(() {
    initSizeConfigurations(Samsung_Galaxy_S9);
  });

  testWidgets('displays correct text and icon', (WidgetTester tester) async {
    await tester.pumpWidget(
      TextIconButton(
        onPressed: null,
        text: 'Tasks',
        icon: Icons.check,
      ),
    );

    expect(find.byIcon(Icons.check), findsOneWidget);
    expect(find.text('Tasks'), findsOneWidget);
  });

  testWidgets('works on all device sizes', (WidgetTester tester) async {
    for (Size size in allDeviceSizes) {
      initSizeConfigurations(size);

      await tester.pumpWidget(
        TextIconButton(
          onPressed: null,
          text: 'Tasks',
          icon: Icons.check,
        ),
      );
    }
  });
}
