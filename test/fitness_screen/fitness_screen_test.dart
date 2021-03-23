import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/fitness_screen/fitness_screen.dart';

import '../utils/device_screen_sizes.dart';
import '../utils/widget_tester.dart';

void main() {
  Future<void> initFitnessScreen(WidgetTester tester, [Size size = samsungGalaxyNote5]) async {
    await tester.pumpWidget(
      ScreenTestingWrapper(
        screenSize: size,
        screen: FitnessScreen(),
      ),
    );
  }

  group('FitnessScreen', () {
    testWidgets('works on all screen sizes', (WidgetTester tester) async {
      for (Size size in allDeviceSizes) {
        await initFitnessScreen(tester, size);
      }
    });
  });
}
