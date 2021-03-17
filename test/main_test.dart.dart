import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/main.dart';

import 'utils/device_screen_sizes.dart';

void main() {
  Future<void> initLachiesLifePlannerApp(WidgetTester tester, [Size size = samsungGalaxyNote5]) async {
    await tester.pumpWidget(LachiesLifePlannerApp());
  }

  testWidgets('app successfully initialises', (WidgetTester tester) async {
    await initLachiesLifePlannerApp(tester);
  });
}
