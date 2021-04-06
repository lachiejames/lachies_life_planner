import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/shared/config/firebase_config.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/task_bloc.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/task_event.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/task_state.dart';
import 'package:lachies_life_planner/tasks_screen/models/task_repository.dart';
import 'package:mockito/mockito.dart';

import '../../utils/mock_firestore_data.dart';

class MockTasksRepository extends Mock implements TasksRepository {}

void main() {
  TasksRepository mockTasksRepository;

  setUp(() {
    setFirestoreInstance(MockFirestoreInstance());
    mockTasksRepository = MockTasksRepository();
  });

  group('TaskBloc', () {
    blocTest(
      'LoadTasksEvent emits [TasksLoadingState, TasksLoadedState]',
      build: () {
        when(mockTasksRepository.getTasksStream()).thenAnswer((_) => Stream.value(mockTaskList));
        return TasksBloc(tasksRepository: mockTasksRepository);
      },
      act: (bloc) => bloc.add(LoadTasksEvent()),
      expect: () => [TasksLoadingState(), TasksLoadedState(mockTaskList)],
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
  });
}
