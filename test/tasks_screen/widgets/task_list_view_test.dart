import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/shared/config/firebase_config.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/task_bloc.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/task_event.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';
import 'package:lachies_life_planner/tasks_screen/models/task_repository.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/task_list_view.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/task_widget.dart';

import '../../utils/device_screen_sizes.dart';
import '../../utils/mock_firestore_data.dart';
import '../../utils/widget_tester.dart';

void main() {
  TasksRepository tasksRepository;
  TasksBloc tasksBloc;

  Future<void> initTaskListView(WidgetTester tester, [Size size = samsungGalaxyNote5]) async {
    await tester.pumpWidget(
      BlocProvider.value(
        value: tasksBloc,
        child: MaterialApp(
          home: Scaffold(
            body: WidgetTestingWrapper(
              screenSize: size,
              widget: TaskListView(),
            ),
          ),
        ),
      ),
    );
  }

  group('TaskListView', () {
    setUp(() async {
      setFirestoreInstance(MockFirestoreInstance());
      tasksRepository = TasksRepository();
      tasksBloc = TasksBloc(tasksRepository: tasksRepository);
      tasksBloc.add(LoadTasksEvent());
    });

    testWidgets('displays correct text and icon', (WidgetTester tester) async {
      await initTaskListView(tester);
    });

    testWidgets('works on all screen sizes', (WidgetTester tester) async {
      for (Size size in allDeviceSizes) {
        await initTaskListView(tester, size);
      }
    });

    testWidgets('initially shows CircularProgressIndicator', (WidgetTester tester) async {
      await initTaskListView(tester);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('displays all task widgets in Firestore', (WidgetTester tester) async {
      await tester.runAsync(() async {
        await initTaskListView(tester);

        for (Task task in mockTaskList) {
          tasksBloc.add(AddTaskEvent(task));
        }

        await flushAllMicrotasks(tester);
        expect(find.byType(TaskWidget), findsNWidgets(10));
      });
    });
  });
}
