import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/finance_screen/finance_screen.dart';

import '../utils/device_screen_sizes.dart';
import '../utils/widget_pumper.dart';

void main() {
  Future<void> initFinanceScreen(WidgetTester tester, [Size size = samsungGalaxyNote5]) async {
    await tester.pumpWidget(
      ScreenTestingWrapper(
        screenSize: size,
        screen: FinanceScreen(),
      ),
    );
  }

  testWidgets('works on all screen sizes', (WidgetTester tester) async {
    for (Size size in allDeviceSizes) {
      await initFinanceScreen(tester, size);
    }
  });
}
