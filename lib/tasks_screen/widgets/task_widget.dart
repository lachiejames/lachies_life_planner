import 'package:flutter/material.dart';
import 'package:lachies_life_planner/tasks_screen/models/task-database-operations.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';

class TaskWidget extends StatelessWidget {
  final Task task;

  TaskWidget({this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(task.name),
        leading: Checkbox(
          value: task.isComplete,
          onChanged: (bool value) => updateTask(task.copyWith(isComplete: value)),
        ),
      ),
    );
  }
}
