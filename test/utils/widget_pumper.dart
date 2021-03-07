import 'package:flutter/material.dart';
import 'package:lachies_life_planner/shared/size_config.dart';

import 'device_screen_sizes.dart';

class ScreenTestingWrapper extends StatelessWidget {
  final Size screenSize;
  final Widget screen;

  ScreenTestingWrapper({this.screenSize = samsungGalaxyS9, this.screen});

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

  WidgetTestingWrapper({this.screenSize = samsungGalaxyS9, this.widget});

  @override
  Widget build(BuildContext context) {
    initSizeConfigurations(screenSize);

    return widget;
  }
}