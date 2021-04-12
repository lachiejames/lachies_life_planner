import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/shared/config/size_config.dart';

import 'device_screen_sizes.dart';

@immutable
class ScreenTestingWrapper extends StatelessWidget {
  final Size screenSize;
  final Widget screen;

  const ScreenTestingWrapper({@required this.screen,this.screenSize = samsungGalaxyS9});

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

@immutable
class WidgetTestingWrapper extends StatelessWidget {
  final Size screenSize;
  final Widget widget;

  const WidgetTestingWrapper({ @required this.widget,this.screenSize = samsungGalaxyS9});

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
  await tester.pump(const Duration(seconds: 1));
}

Future<void> tap(WidgetTester tester, Finder finder) async {
  await tester.tap(finder);
  await flushAllMicrotasks(tester);
}

Future<void> tapOff(WidgetTester tester) async {
  await tester.tapAt(Offset.zero);
  await flushAllMicrotasks(tester);
}

Future<void> tapDropDownMenu(WidgetTester tester, String menuOption) async {}
