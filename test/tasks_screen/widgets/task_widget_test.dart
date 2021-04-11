import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/shared/config/firebase_config.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/tasks_bloc.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';
import 'package:lachies_life_planner/tasks_screen/models/tasks_repository.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/edit_task_widget/edit_task_sheet.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/task_widget.dart';

import '../../utils/device_screen_sizes.dart';
import '../../utils/mock_firestore_data.dart';
import '../../utils/repository_operations.dart';
import '../../utils/widget_tester.dart';

void main() {
  TasksRepository tasksRepository;

  Future<void> initTaskWidget(WidgetTester tester, {Task task, Size size = samsungGalaxyNote5}) async {
    await tasksRepository.addTask(task);

    await tester.pumpWidget(
      BlocProvider(
        create: (context) => TasksBloc(tasksRepository: tasksRepository),
        child: MaterialApp(
          home: Scaffold(
            body: WidgetTestingWrapper(
              screenSize: size,
              widget: TaskWidget(
                task: task,
              ),
            ),
          ),
        ),
      ),
    );
  }

  group('TaskWidget', () {
    setUp(() {
      setFirestoreInstance(MockFirestoreInstance());
      tasksRepository = TasksRepository();
    });

    testWidgets('displays correct text and icon', (WidgetTester tester) async {
      await initTaskWidget(tester, task: mockTask);

      expect(find.text(mockTask.name), findsOneWidget);
      expect(find.byType(Checkbox), findsOneWidget);
    });

    testWidgets('works on all screen sizes', (WidgetTester tester) async {
      for (Size size in allDeviceSizes) {
        await initTaskWidget(tester, task: mockTask, size: size);
      }
    });

    testWidgets('tapping it opens the sheet', (WidgetTester tester) async {
      await initTaskWidget(tester, task: mockTask);

      await tap(tester, find.text(mockTask.name));

      expect(find.byType(EditTaskSheet), findsOneWidget);
    });

    testWidgets('tapping the checkbox completes the task', (WidgetTester tester) async {
      await initTaskWidget(tester, task: mockTask);

      Task taskBeforeTap = await getTaskByID(mockTask.id);
      expect(taskBeforeTap.isComplete, false);

      await tap(tester, find.byType(Checkbox));

      Task taskAfterTap = await getTaskByID(mockTask.id);
      expect(taskAfterTap.isComplete, true);
    });
  });
}
