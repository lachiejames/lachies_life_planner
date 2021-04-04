import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/task_bloc.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/task_state.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/task_widget.dart';

class TaskListView extends StatelessWidget {
  TaskListView() : super(key: UniqueKey());

  Widget _getTasksLoadingView() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _getTasksLoadedView(List<Task> tasks) {
    return ListView(
      children: tasks.map((Task task) => TaskWidget(task: task)).toList(),
    );
  }

  Widget _getTasksErrorView() {
    return Container(
      child: Text('something went wrong :('),
    );
  }

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
}
