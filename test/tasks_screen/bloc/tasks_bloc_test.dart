import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/tasks_bloc.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/tasks_event.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/tasks_state.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';
import 'package:lachies_life_planner/tasks_screen/models/tasks_repository.dart';
import 'package:mockito/mockito.dart';

import '../../utils/mock_firestore_data.dart';

// Cannot make a mock immutable without unnecessary boilerplate
// ignore: must_be_immutable
class MockTasksRepository extends Mock implements TasksRepository {}

class FakeTasksEvent extends TasksEvent {}

void main() {
  TasksRepository mockTasksRepository;

  setUp(() {
    mockTasksRepository = MockTasksRepository();
  });

  group('TaskBloc', () {
    blocTest(
      'when getTasksStream() is succeessful, LoadTasksEvent leads to TasksLoadedEvent, which emits [TasksLoadedState]',
      build: () {
        when(mockTasksRepository.getTasksStream()).thenAnswer((_) => Stream<List<Task>>.value(mockTaskList));
        return TasksBloc(tasksRepository: mockTasksRepository);
      },
      act: (dynamic bloc) => bloc.add(LoadTasksEvent()),
      expect: () => [TasksLoadedState(mockTaskList)],
    );

    blocTest(
      'when getTasksStream() fails, LoadTasksEvent emits []',
      build: () {
        when(mockTasksRepository.getTasksStream()).thenThrow(Exception('something went wrong'));
        return TasksBloc(tasksRepository: mockTasksRepository);
      },
      act: (dynamic bloc) => bloc.add(LoadTasksEvent()),
      expect: () => [],
    );

    blocTest(
      'TasksLoadedEvent emits [TasksLoadedState]',
      build: () {
        when(mockTasksRepository.getTasksStream()).thenAnswer((_) => Stream<List<Task>>.value(mockTaskList));
        return TasksBloc(tasksRepository: mockTasksRepository);
      },
      act: (dynamic bloc) => bloc.add(TasksLoadedEvent(mockTaskList)),
      expect: () => [TasksLoadedState(mockTaskList)],
    );

    blocTest(
      'AddTaskEvent emits no state changes',
      build: () => TasksBloc(tasksRepository: mockTasksRepository),
      act: (dynamic bloc) => bloc.add(AddTaskEvent(mockTask)),
      expect: () => [],
    );

    blocTest(
      'UpdateTaskEvent emits no state changes',
      build: () => TasksBloc(tasksRepository: mockTasksRepository),
      act: (dynamic bloc) => bloc.add(UpdateTaskEvent(mockTask)),
      expect: () => [],
    );

    blocTest(
      'DeleteTaskEvent emits no state changes',
      build: () => TasksBloc(tasksRepository: mockTasksRepository),
      act: (dynamic bloc) => bloc.add(DeleteTaskEvent(mockTask)),
      expect: () => [],
    );

    blocTest(
      'DeleteAllTasksEvent emits no state changes',
      build: () => TasksBloc(tasksRepository: mockTasksRepository),
      act: (dynamic bloc) => bloc.add(DeleteAllTasksEvent()),
      expect: () => [],
    );

    test('throws exception when an unknown TaskEvent is passed', () async {
      await runZonedGuarded(() async {
        TasksBloc(tasksRepository: mockTasksRepository).add(FakeTasksEvent());
      }, (Object exception, StackTrace stackTrace) {
        // We actually throw UnknownBlocEventException, but that cannot be tested
        expect(exception, isA<BlocUnhandledErrorException>());
      });
    });
  });
}
