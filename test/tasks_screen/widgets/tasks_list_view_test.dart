import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/shared/config/firebase_config.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/tasks_bloc.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/tasks_event.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';
import 'package:lachies_life_planner/tasks_screen/models/tasks_repository.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/tasks_list_view.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/task_widget.dart';

import '../../utils/device_screen_sizes.dart';
import '../../utils/mock_firestore_data.dart';
import '../../utils/widget_tester.dart';

void main() {
  TasksRepository tasksRepository;
  TasksBloc tasksBloc;

  Future<void> initTasksListView(WidgetTester tester, [Size size = samsungGalaxyNote5]) async {
    await tester.pumpWidget(
      BlocProvider<TasksBloc>.value(
        value: tasksBloc,
        child: MaterialApp(
          home: Scaffold(
            body: WidgetTestingWrapper(
              screenSize: size,
              widget: const TasksListView(),
            ),
          ),
        ),
      ),
    );
  }

  group('TasksListView', () {
    setUp(() {
      setFirestoreInstance(MockFirestoreInstance());
      tasksRepository = TasksRepository();
      tasksBloc = TasksBloc(tasksRepository: tasksRepository);
      tasksBloc.add(LoadTasksEvent());
    });

    testWidgets('displays correct text and icon', (WidgetTester tester) async {
      await initTasksListView(tester);
    });

    testWidgets('works on all screen sizes', (WidgetTester tester) async {
      for (Size size in allDeviceSizes) {
        await initTasksListView(tester, size);
      }
    });

    testWidgets('initially shows CircularProgressIndicator', (WidgetTester tester) async {
      await initTasksListView(tester);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('displays all task widgets in Firestore', (WidgetTester tester) async {
      // Required for tests involving streams - https://github.com/flutter/flutter/issues/17738#issuecomment-392237064
      await tester.runAsync(() async {
        await initTasksListView(tester);

        for (Task task in mockTaskList) {
          tasksBloc.add(AddTaskEvent(task));
        }

        await flushAllMicrotasks(tester);
        expect(find.byType(TaskWidget), findsNWidgets(10));
      });
    });
  });
}
