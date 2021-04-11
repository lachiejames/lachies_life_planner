import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lachies_life_planner/shared/widgets/app_bar_overflow_menu.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/tasks_bloc.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/tasks_event.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/add_task_button.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/tasks_list_view.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen() : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
        actions: [
          AppBarOverflowMenu(
            menuOptions: <String, Function>{
              'Delete All Tasks': () => _deleteAllTasks(context),
            },
          ),
        ],
      ),
      floatingActionButton: AddTaskButton(),
      body: TasksListView(),
    );
  }

  void _deleteAllTasks(BuildContext context) {
    BlocProvider.of<TasksBloc>(context).add(DeleteAllTasksEvent());
  }
}
