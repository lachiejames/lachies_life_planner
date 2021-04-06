import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/task_event.dart';

import '../../utils/mock_firestore_data.dart';

void main() {
  group('TasksEvent', () {
    test('LoadTasksEvents can be compared with deep equality', () {
      expect(LoadTasksEvent(), LoadTasksEvent());
    });

    test('TasksLoadedEvent can be compared with deep equality', () {
      expect(TasksLoadedEvent(mockTaskList), TasksLoadedEvent(mockTaskList));
      expect(TasksLoadedEvent(mockTaskList) == TasksLoadedEvent(mockTaskList + [mockTask]), false);
    });

    test('AddTaskEvent can be compared with deep equality', () {
      expect(AddTaskEvent(mockTask), AddTaskEvent(mockTask));
      expect(AddTaskEvent(mockTask) == AddTaskEvent(mockTask.copyWith(isComplete: true)), false);
    });

    test('UpdateTaskEvent can be compared with deep equality', () {
      expect(UpdateTaskEvent(mockTask), UpdateTaskEvent(mockTask));
      expect(UpdateTaskEvent(mockTask) == UpdateTaskEvent(mockTask.copyWith(isComplete: true)), false);
    });

    test('DeleteTaskEvent can be compared with deep equality', () {
      expect(DeleteTaskEvent(mockTask), DeleteTaskEvent(mockTask));
      expect(DeleteTaskEvent(mockTask) == DeleteTaskEvent(mockTask.copyWith(isComplete: true)), false);
    });

    test('DeleteAllTasksEvent can be compared with deep equality', () {
      expect(DeleteAllTasksEvent(), DeleteAllTasksEvent());
    });
  });
}
