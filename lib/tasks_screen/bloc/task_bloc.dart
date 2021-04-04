import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/task_event.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/task_state.dart';
import 'package:lachies_life_planner/tasks_screen/models/task_repository.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final TasksRepository tasksRepository;
  StreamSubscription _tasksSubscription;

  TasksBloc({@required this.tasksRepository}) : super(TasksLoading());

  @override
  Stream<TasksState> mapEventToState(TasksEvent event) async* {
    if (event is LoadTasks) {
      yield* _mapLoadTasksToState();
    } else if (event is AddTask) {
      yield* _mapAddTaskToState(event);
    } else if (event is UpdateTask) {
      yield* _mapUpdateTaskToState(event);
    } else if (event is DeleteTask) {
      yield* _mapDeleteTaskToState(event);
    } else {
      print('wtf');
    }
  }

  Stream<TasksState> _mapLoadTasksToState() async* {
    _tasksSubscription = tasksRepository.getTasksStream().listen((event) {
      print('xxx - $event');
    });
  }

  Stream<TasksState> _mapAddTaskToState(AddTask event) async* {
    await tasksRepository.addTask(event.task);
  }

  Stream<TasksState> _mapUpdateTaskToState(UpdateTask event) async* {
    await tasksRepository.updateTask(event.updatedTask);
  }

  Stream<TasksState> _mapDeleteTaskToState(DeleteTask event) async* {
    await tasksRepository.deleteTask(event.task);
  }

  @override
  Future<void> close() {
    _tasksSubscription?.cancel();
    return super.close();
  }
}
