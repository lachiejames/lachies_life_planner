import 'package:flutter/material.dart';
import 'package:lachies_life_planner/tasks_screen/models/task-database-operations.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/edit_task_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class TaskWidget extends StatelessWidget {
  final Task task;

  TaskWidget({this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => showMaterialModalBottomSheet(
          context: context,
          builder: (BuildContext context) => EditTaskWidget(task: task),
        ),
        title: Text(task.name),
        leading: Checkbox(
          value: task.isComplete,
          onChanged: (bool value) => updateTask(task.copyWith(isComplete: value)),
        ),
      ),
    );
  }
}
