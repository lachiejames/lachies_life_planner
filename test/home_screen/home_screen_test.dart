import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/home_screen/home_screen.dart';
import 'package:lachies_life_planner/shared/size_config.dart';

import '../utils/mock_data.dart';

void main() {
  setUp(() {
    initSizeConfigurations(Samsung_Galaxy_S9);
  });

  testWidgets('initialised with Home screen buttoms', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: HomeScreen(),
    ));

    expect(find.byIcon(Icons.check), findsOneWidget);
  });

    testWidgets('works on all device sizes', (WidgetTester tester) async {
    for (Size size in allDeviceSizes) {
      print('xxx - $size');
      initSizeConfigurations(size);

     await tester.pumpWidget(MaterialApp(home: HomeScreen()));
    }
  });
}
