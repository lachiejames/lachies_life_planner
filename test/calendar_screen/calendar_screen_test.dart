import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/calendar_screen/calendar_screen.dart';

import '../utils/device_screen_sizes.dart';
import '../utils/widget_pumper.dart';

void main() {
  Future<void> initCalendarScreen(WidgetTester tester, [Size size = samsungGalaxyNote5]) async {
    await tester.pumpWidget(
      ScreenTestingWrapper(
        screenSize: size,
        screen: CalendarScreen(),
      ),
    );
  }

  group('CalendarScreen', () {
    testWidgets('works on all screen sizes', (WidgetTester tester) async {
      for (Size size in allDeviceSizes) {
        await initCalendarScreen(tester, size);
      }
    });
  });
}
