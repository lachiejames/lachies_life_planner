import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/home_screen/home_screen.dart';
import 'package:lachies_life_planner/home_screen/widgets/text_icon_button.dart';

import '../utils/device_screen_sizes.dart';

void main() {
  testWidgets('initialised with Home screen buttons', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(
          data: MediaQueryData(
            size: googlePixel4,
          ),
          child: HomeScreen(),
        ),
      ),
    );

    expect(find.byType(TextIconButton), findsNWidgets(6));
  });

  testWidgets('works on all screen sizes', (WidgetTester tester) async {
    for (Size size in allDeviceSizes) {
      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: MediaQueryData(
              size: size,
            ),
            child: HomeScreen(),
          ),
        ),
      );
    }
  });
}
