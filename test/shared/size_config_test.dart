import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/shared/size_config.dart';

import '../utils/device_screen_sizes.dart';

void main() {
  testWidgets('sets values for screenWidthUnit and screenHeightUnit', (WidgetTester tester) async {
    initSizeConfigurations(samsungGalaxyS9);

    expect(screenWidthUnit, 3.6);
    expect(screenHeightUnit, 7.4);
  });
}
