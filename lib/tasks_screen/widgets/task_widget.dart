import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/task_bloc.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/edit_task_widget/edit_task_sheet.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class TaskWidget extends StatelessWidget {
  final Task task;

  TaskWidget({this.task}) : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Card(
        child: ListTile(
          onTap: () => showMaterialModalBottomSheet(
            context: context,
            builder: (BuildContext context) => EditTaskSheet(task: task),
          ),
          title: Text(task.name),
          leading: Checkbox(
            value: task.isComplete,
            onChanged: (bool value) =>
                BlocProvider.of<TasksBloc>(context).tasksRepository.updateTask(task.copyWith(isComplete: value)),
          ),
        ),
      ),
    );
  }
}
