import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/task_event.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/task_state.dart';
import 'package:lachies_life_planner/tasks_screen/models/task_database_operations.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  StreamSubscription _tasksSubscription;

  TasksBloc() : super(TasksLoading());

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
    _tasksSubscription = getTasksStream().listen((event) {
      print('xxx - $event');
    });
  }

  Stream<TasksState> _mapAddTaskToState(AddTask event) async* {
    await addTask(event.task);
  }

  Stream<TasksState> _mapUpdateTaskToState(UpdateTask event) async* {
    await updateTask(event.updatedTask);
  }

  Stream<TasksState> _mapDeleteTaskToState(DeleteTask event) async* {
    await deleteTask(event.task);
  }

  @override
  Future<void> close() {
    _tasksSubscription?.cancel();
    return super.close();
  }
}
