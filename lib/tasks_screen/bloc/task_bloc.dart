import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/task_event.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/task_state.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';
import 'package:lachies_life_planner/tasks_screen/models/task_repository.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final TasksRepository tasksRepository;
  StreamSubscription _tasksSubscription;

  TasksBloc({@required this.tasksRepository}) : super(TasksLoadingState());

  @override
  Stream<TasksState> mapEventToState(TasksEvent event) async* {
    if (event is LoadTasksEvent) {
      yield* _mapLoadTasksToState();
    } else if (event is TasksLoadedEvent) {
      yield* _mapTasksLoadedToState(event);
    } else if (event is AddTaskEvent) {
      yield* _mapAddTaskToState(event);
    } else if (event is UpdateTaskEvent) {
      yield* _mapUpdateTaskToState(event);
    } else if (event is DeleteTaskEvent) {
      yield* _mapDeleteTaskToState(event);
    } else {
      throw Exception('Unknown TasksEvent: $event');
    }
  }

  Stream<TasksState> _mapLoadTasksToState() async* {
    _tasksSubscription = tasksRepository.getTasksStream().listen(
          (List<Task> tasks) => add(TasksLoadedEvent(tasks)),
        );
  }

  Stream<TasksState> _mapTasksLoadedToState(TasksLoadedEvent event) async* {
    yield TasksLoadedState(event.tasks);
  }

  Stream<TasksState> _mapAddTaskToState(AddTaskEvent event) async* {
    tasksRepository.addTask(event.task);
  }

  Stream<TasksState> _mapUpdateTaskToState(UpdateTaskEvent event) async* {
    tasksRepository.updateTask(event.updatedTask);
  }

  Stream<TasksState> _mapDeleteTaskToState(DeleteTaskEvent event) async* {
    tasksRepository.deleteTask(event.task);
  }

  @override
  Future<void> close() {
    _tasksSubscription?.cancel();
    return super.close();
  }
}
