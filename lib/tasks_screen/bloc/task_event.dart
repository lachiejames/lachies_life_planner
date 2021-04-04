import 'package:equatable/equatable.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class LoadTasks extends TasksEvent {}

class AddTask extends TasksEvent {
  final Task task;

  const AddTask(this.task);

  @override
  List<Object> get props => [task];

  @override
  String toString() => 'AddTask { task: $task }';
}

class UpdateTask extends TasksEvent {
  final Task updatedTask;

  const UpdateTask(this.updatedTask);

  @override
  List<Object> get props => [updatedTask];

  @override
  String toString() => 'UpdateTask { updatedTask: $updatedTask }';
}

class DeleteTask extends TasksEvent {
  final Task task;

  const DeleteTask(this.task);

  @override
  List<Object> get props => [task];

  @override
  String toString() => 'DeleteTask { task: $task }';
}
