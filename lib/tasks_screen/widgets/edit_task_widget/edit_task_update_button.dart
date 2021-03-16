import 'package:flutter/material.dart';
import 'package:lachies_life_planner/shared/config/size_config.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';
import 'package:lachies_life_planner/tasks_screen/models/task_database_operations.dart';

class EditTaskUpdateButton extends StatelessWidget {
  final Task taskToUpdate;
  final TextEditingController taskEditingController;

  EditTaskUpdateButton({@required this.taskToUpdate, @required this.taskEditingController}) : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(screenWidthUnit * 8),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          onPressed: () {
            updateTask(taskToUpdate.copyWith(name: taskEditingController.text));
            Navigator.pop(context);
          },
          child: Text('Update'),
        ),
      ),
    );
  }
}
