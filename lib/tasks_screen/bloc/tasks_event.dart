import 'package:equatable/equatable.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class LoadTasksEvent extends TasksEvent {}

class TasksLoadedEvent extends TasksEvent {
  final List<Task> tasks;

  const TasksLoadedEvent(this.tasks);

  @override
  List<Object> get props => [tasks];
}

class AddTaskEvent extends TasksEvent {
  final Task task;

  const AddTaskEvent(this.task);

  @override
  List<Object> get props => [task];
}

class UpdateTaskEvent extends TasksEvent {
  final Task updatedTask;

  const UpdateTaskEvent(this.updatedTask);

  @override
  List<Object> get props => [updatedTask];
}

class DeleteTaskEvent extends TasksEvent {
  final Task task;

  const DeleteTaskEvent(this.task);

  @override
  List<Object> get props => [task];
}

class DeleteAllTasksEvent extends TasksEvent {}
