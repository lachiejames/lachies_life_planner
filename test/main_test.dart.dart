import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/main.dart';

void main() {
  testWidgets('app successfully initialises', (WidgetTester tester) async {
    await tester.pumpWidget(LachiesLifePlannerApp());
  });
}
