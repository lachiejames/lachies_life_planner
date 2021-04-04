import 'package:equatable/equatable.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';

abstract class TasksState extends Equatable {
  const TasksState();

  @override
  List<Object> get props => [];
}

class TasksLoadingState extends TasksState {}

class TasksLoadedState extends TasksState {
  final List<Task> tasks;

  const TasksLoadedState([this.tasks = const []]);

  @override
  List<Object> get props => [tasks];

  @override
  String toString() => 'TasksLoaded { tasks: $tasks }';
}
