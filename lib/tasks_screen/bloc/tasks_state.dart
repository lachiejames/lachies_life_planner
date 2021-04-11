import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';

@immutable
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
}
