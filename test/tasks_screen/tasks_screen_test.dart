import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/shared/config/firebase_config.dart';
import 'package:lachies_life_planner/shared/widgets/app_bar_overflow_menu.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/task_bloc.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/task_event.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';
import 'package:lachies_life_planner/tasks_screen/models/task_repository.dart';
import 'package:lachies_life_planner/tasks_screen/tasks_screen.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/task_widget.dart';

import '../utils/device_screen_sizes.dart';
import '../utils/mock_firestore_data.dart';
import '../utils/widget_tester.dart';

void main() {
  TasksRepository tasksRepository;
  TasksBloc tasksBloc;

  Future<void> initTasksScreen(WidgetTester tester, [Size size = samsungGalaxyNote5]) async {
    await tester.pumpWidget(
      BlocProvider.value(
        value: tasksBloc,
        child: ScreenTestingWrapper(
          screenSize: size,
          screen: TasksScreen(),
        ),
      ),
    );
  }

  Future<void> populateTaskWidgets(WidgetTester tester) async {
    for (Task task in mockTaskList) {
      await tasksRepository.addTask(task);
    }

    await flushAllMicrotasks(tester);
  }

  group('TasksScreen', () {
    setUp(() {
      setFirestoreInstance(MockFirestoreInstance());
      tasksRepository = TasksRepository();
      tasksBloc = TasksBloc(tasksRepository: tasksRepository);
      tasksBloc.add(LoadTasksEvent());
    });

    testWidgets('works on all screen sizes', (WidgetTester tester) async {
      for (Size size in allDeviceSizes) {
        await initTasksScreen(tester, size);
      }
    });

    testWidgets('displays all TaskWidgets', (WidgetTester tester) async {
      await tester.runAsync(() async {
        await initTasksScreen(tester);
        await populateTaskWidgets(tester);

        // Need to add "skipOffstage: false" to find off-screen TaskWidgets
        expect(find.byType(TaskWidget, skipOffstage: false), findsNWidgets(10));
      });
    });

    group('overflow menu', () {
      testWidgets('displays menu items when tapped', (WidgetTester tester) async {
        await initTasksScreen(tester);
        await tap(tester, find.byType(AppBarOverflowMenu));

        expect(find.text('Delete All Tasks'), findsOneWidget);
      });

      testWidgets('tapping "Delete All Tasks" will remove all TaskWidgets', (WidgetTester tester) async {
        await initTasksScreen(tester);
        await populateTaskWidgets(tester);

        await tap(tester, find.byType(AppBarOverflowMenu));
        await tap(tester, find.text('Delete All Tasks'));

        // Currently not working without this line, but this seems to be due to a bug in flutter_test
        // https://github.com/flutter/flutter/issues/78832
        await initTasksScreen(tester);

        expect(find.byType(TaskWidget), findsNothing);
      });

      testWidgets('collapses after tapping off', (WidgetTester tester) async {
        await initTasksScreen(tester);

        expect(find.text('Delete All Tasks'), findsNothing);
        await tap(tester, find.byType(AppBarOverflowMenu));
        expect(find.text('Delete All Tasks'), findsOneWidget);
        await tapOff(tester);
        expect(find.text('Delete All Tasks'), findsNothing);
      });
    });
  });
}
