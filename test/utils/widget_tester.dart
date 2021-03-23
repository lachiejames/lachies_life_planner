import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/shared/config/size_config.dart';

import 'device_screen_sizes.dart';

class ScreenTestingWrapper extends StatelessWidget {
  final Size screenSize;
  final Widget screen;

  ScreenTestingWrapper({this.screenSize = samsungGalaxyS9, @required this.screen}) : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MediaQuery(
        data: MediaQueryData(
          size: screenSize,
        ),
        child: screen,
      ),
    );
  }
}

class WidgetTestingWrapper extends StatelessWidget {
  final Size screenSize;
  final Widget widget;

  WidgetTestingWrapper({this.screenSize = samsungGalaxyS9, @required this.widget}) : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    initSizeConfigurations(screenSize);

    return widget;
  }
}

// I don't know why this works, but it does
// Deleting any of these lines will cause certain tests to fail
Future<void> flushAllMicrotasks(WidgetTester tester) async {
  await tester.idle();
  await tester.pump();
  await tester.pump(Duration(seconds: 1));
}

Future<void> tap(WidgetTester tester, Finder finder) async {
  await tester.tap(finder);
  await flushAllMicrotasks(tester);
}

Future<void> tapOff(WidgetTester tester) async {
  await tester.tapAt(Offset.zero);
  await flushAllMicrotasks(tester);
}
