import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/calendar_screen/calendar_screen.dart';
import 'package:lachies_life_planner/finance_screen/finance_screen.dart';
import 'package:lachies_life_planner/fitness_screen/fitness_screen.dart';
import 'package:lachies_life_planner/goals_screen/goals_screen.dart';
import 'package:lachies_life_planner/home_screen/home_screen.dart';
import 'package:lachies_life_planner/home_screen/widgets/text_icon_button.dart';
import 'package:lachies_life_planner/homework_screen/homework_screen.dart';
import 'package:lachies_life_planner/shared/config/firebase_config.dart';
import 'package:lachies_life_planner/tasks_screen/tasks_screen.dart';

import '../utils/device_screen_sizes.dart';
import '../utils/widget_pumper.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  Future<void> initHomeScreen(WidgetTester tester, [Size size = samsungGalaxyNote5]) async {
    await tester.pumpWidget(
      ScreenTestingWrapper(
        screenSize: size,
        screen: HomeScreen(),
      ),
    );
  }

  setUp(() {
    setFirestoreInstance(MockFirestoreInstance());
  });

  testWidgets('initialised with Home screen buttons', (WidgetTester tester) async {
    await initHomeScreen(tester);
    expect(find.byType(TextIconButton), findsNWidgets(6));
  });

  testWidgets('works on all screen sizes', (WidgetTester tester) async {
    for (Size size in allDeviceSizes) {
      await initHomeScreen(tester, size);
    }
  });

  testWidgets('pressing "Tasks" navigates you to TasksScreen', (WidgetTester tester) async {
    await initHomeScreen(tester);

    await tester.tap(find.text('Tasks'));
    await tester.pumpAndSettle();

    expect(find.byType(TasksScreen), findsOneWidget);
  });

  testWidgets('pressing "Calendar" navigates you to CalendarScreen', (WidgetTester tester) async {
    await initHomeScreen(tester);

    await tester.tap(find.text('Calendar'));
    await tester.pumpAndSettle();

    expect(find.byType(CalendarScreen), findsOneWidget);
  });

  testWidgets('pressing "Fitness" navigates you to FitnessScreen', (WidgetTester tester) async {
    await initHomeScreen(tester);

    await tester.tap(find.text('Fitness'));
    await tester.pumpAndSettle();

    expect(find.byType(FitnessScreen), findsOneWidget);
  });

  testWidgets('pressing "Homework" navigates you to HomeworkScreen', (WidgetTester tester) async {
    await initHomeScreen(tester);

    await tester.tap(find.text('Homework'));
    await tester.pumpAndSettle();

    expect(find.byType(HomeworkScreen), findsOneWidget);
  });

  testWidgets('pressing "Finance" navigates you to FinanceScreen', (WidgetTester tester) async {
    await initHomeScreen(tester);

    await tester.tap(find.text('Finance'));
    await tester.pumpAndSettle();

    expect(find.byType(FinanceScreen), findsOneWidget);
  });

  testWidgets('pressing "Goals" navigates you to GoalsScreen', (WidgetTester tester) async {
    await initHomeScreen(tester);

    await tester.tap(find.text('Goals'));
    await tester.pumpAndSettle();

    expect(find.byType(GoalsScreen), findsOneWidget);
  });
}
