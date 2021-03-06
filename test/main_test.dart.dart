import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/home_screen/widgets/text_icon_button.dart';
import 'package:lachies_life_planner/shared/size_config.dart';

import 'utils/mock_data.dart';

void main() {
  setUp(() {
    initSizeConfigurations(Samsung_Galaxy_S9);
  });
  testWidgets('initialised with expected values', (WidgetTester tester) async {
    await tester.pumpWidget(
      TextIconButton(
        onPressed: null,
        text: 'Tasks',
        icon: Icons.check,
      ),
    );

    expect(find.byIcon(Icons.check), findsOneWidget);
  });
}
