
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lachies_life_planner/shared/size_config.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';
import 'package:lachies_life_planner/tasks_screen/models/task_database_operations.dart';

class EditTaskUpdateButton extends StatelessWidget {
  final Task task;
  final String newText;

  EditTaskUpdateButton({@required this.task, @required this.newText});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(screenWidthUnit * 8),
        child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
          onPressed: () {
            if (task == null) {
              addTask(
                Task(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  dateCreated: Timestamp.now(),
                  name: newText,
                  isComplete: false,
                ),
              );
            } else {
              updateTask(task.copyWith(name: newText));
            }

            Navigator.pop(context);
          },
          child: Text(task == null ? 'Add' : 'Update'),
        ),
      ),
    );
  }
}