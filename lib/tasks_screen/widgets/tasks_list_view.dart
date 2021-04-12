import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/tasks_bloc.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/tasks_state.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/task_widget.dart';

@immutable
class TasksListView extends StatelessWidget {
  const TasksListView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (BuildContext context, TasksState state) {
        if (state is TasksLoadingState) {
          return _getTasksLoadingView();
        } else if (state is TasksLoadedState) {
          return _getTasksLoadedView(state.tasks);
        } else {
          return _getTasksErrorView();
        }
      },
    );
  }

  Widget _getTasksLoadingView() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _getTasksLoadedView(List<Task> tasks) {
    return ListView(
      children: tasks.map((Task task) => TaskWidget(task: task)).toList(),
    );
  }

  Widget _getTasksErrorView() {
    return const Center(
      child: Text('something went wrong :('),
    );
  }
}
