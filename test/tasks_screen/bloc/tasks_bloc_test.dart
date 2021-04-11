import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/shared/config/firebase_config.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/tasks_bloc.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/tasks_event.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/tasks_state.dart';
import 'package:lachies_life_planner/tasks_screen/models/tasks_repository.dart';
import 'package:mockito/mockito.dart';

import '../../utils/mock_firestore_data.dart';

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
        when(mockTasksRepository.getTasksStream()).thenAnswer((_) => Stream.value(mockTaskList));
        return TasksBloc(tasksRepository: mockTasksRepository);
      },
      act: (bloc) => bloc.add(LoadTasksEvent()),
      expect: () => [TasksLoadedState(mockTaskList)],
    );

    blocTest(
      'when getTasksStream() fails, LoadTasksEvent emits []',
      build: () {
        when(mockTasksRepository.getTasksStream()).thenThrow(Exception('something went wrong'));
        return TasksBloc(tasksRepository: mockTasksRepository);
      },
      act: (bloc) => bloc.add(LoadTasksEvent()),
      expect: () => [],
    );

    blocTest(
      'TasksLoadedEvent emits [TasksLoadedState]',
      build: () {
        when(mockTasksRepository.getTasksStream()).thenAnswer((_) => Stream.value(mockTaskList));
        return TasksBloc(tasksRepository: mockTasksRepository);
      },
      act: (bloc) => bloc.add(TasksLoadedEvent(mockTaskList)),
      expect: () => [TasksLoadedState(mockTaskList)],
    );

    blocTest(
      'AddTaskEvent emits no state changes',
      build: () => TasksBloc(tasksRepository: mockTasksRepository),
      act: (bloc) => bloc.add(AddTaskEvent(mockTask)),
      expect: () => [],
    );

    blocTest(
      'UpdateTaskEvent emits no state changes',
      build: () => TasksBloc(tasksRepository: mockTasksRepository),
      act: (bloc) => bloc.add(UpdateTaskEvent(mockTask)),
      expect: () => [],
    );

    blocTest(
      'DeleteTaskEvent emits no state changes',
      build: () => TasksBloc(tasksRepository: mockTasksRepository),
      act: (bloc) => bloc.add(DeleteTaskEvent(mockTask)),
      expect: () => [],
    );

    blocTest(
      'DeleteAllTasksEvent emits no state changes',
      build: () => TasksBloc(tasksRepository: mockTasksRepository),
      act: (bloc) => bloc.add(DeleteAllTasksEvent()),
      expect: () => [],
    );

    test('throws exception when an unknown TaskEvent is passed', () async {
      await runZonedGuarded(() async {
        TasksBloc(tasksRepository: mockTasksRepository).add(FakeTasksEvent());
      }, (exception, stackTrace) {
        // We actually throw UnknownBlocEventException, but that cannot be tested
        expect(exception, isA<BlocUnhandledErrorException>());
      });
    });
  });
}
