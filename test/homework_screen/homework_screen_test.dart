import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/homework_screen/homework_screen.dart';
import 'package:lachies_life_planner/shared/config/firebase_config.dart';
import 'package:lachies_life_planner/shared/widgets/all_bloc_providers.dart';

import '../utils/device_screen_sizes.dart';
import '../utils/widget_tester.dart';

void main() {
  Future<void> initHomeworkScreen(WidgetTester tester, [Size size = samsungGalaxyNote5]) async {
    await tester.pumpWidget(
      AllBlocProviders(
        child: ScreenTestingWrapper(
          screenSize: size,
          screen: const HomeworkScreen(),
        ),
      ),
    );
  }

  group('HomeworkScreen', () {
    setUp(() {
      setFirestoreInstance(MockFirestoreInstance());
    });

    testWidgets('works on all screen sizes', (WidgetTester tester) async {
      for (Size size in allDeviceSizes) {
        await initHomeworkScreen(tester, size);
        await flushAllMicrotasks(tester);
      }
    });
  });
}
