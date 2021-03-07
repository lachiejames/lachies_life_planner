import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/homework_screen/homework_screen.dart';

import '../utils/device_screen_sizes.dart';
import '../utils/widget_pumper.dart';

void main() {
  testWidgets('works on all screen sizes', (WidgetTester tester) async {
    for (Size size in allDeviceSizes) {
      await tester.pumpWidget(
        ScreenTestingWrapper(
          screenSize: size,
          screen: HomeworkScreen(),
        ),
      );
    }
  });
}
