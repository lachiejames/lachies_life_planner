import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/shared/config/firebase_config.dart';
import 'package:lachies_life_planner/shared/widgets/app_bar_overflow_menu.dart';

import '../../utils/device_screen_sizes.dart';
import '../../utils/widget_tester.dart';

void main() {
  Future<void> initAppBarOverflowMenu(WidgetTester tester, [Size size = samsungGalaxyNote5]) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: WidgetTestingWrapper(
            screenSize: size,
            widget: AppBarOverflowMenu(
              menuOptions: <String, Function>{
                'option 1': () {},
                'option 2': () {},
              },
            ),
          ),
        ),
      ),
    );
  }

  group('AppBarOverflowMenu', () {
    setUp(() {
      setFirestoreInstance(MockFirestoreInstance());
    });

    testWidgets('works on all screen sizes', (WidgetTester tester) async {
      for (Size size in allDeviceSizes) {
        await initAppBarOverflowMenu(tester, size);
      }
    });

    testWidgets('displays correct icon', (WidgetTester tester) async {
      await initAppBarOverflowMenu(tester);
      expect(find.byIcon(Icons.more_vert), findsOneWidget);
    });

    testWidgets('tapping will display menu items', (WidgetTester tester) async {
      await initAppBarOverflowMenu(tester);

      expect(find.text('option 1'), findsNothing);
      expect(find.text('option 2'), findsNothing);

      await tap(tester, find.byType(AppBarOverflowMenu));

      expect(find.text('option 1'), findsOneWidget);
      expect(find.text('option 2'), findsOneWidget);
    });
  });
}
