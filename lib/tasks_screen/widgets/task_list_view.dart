import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/task_bloc.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/task_widget.dart';

class TaskListView extends StatelessWidget {
  TaskListView() : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: StreamBuilder<List<Task>>(
          stream: BlocProvider.of<TasksBloc>(context).tasksRepository.getTasksStream(),
          builder: (BuildContext context, AsyncSnapshot<List<Task>> snapshot) => (!snapshot.hasData)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: snapshot.data.map((Task task) => TaskWidget(task: task)).toList(),
                ),
        ),
      ),
    );
  }
}
