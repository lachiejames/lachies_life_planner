import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lachies_life_planner/shared/size_config.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';
import 'package:lachies_life_planner/tasks_screen/models/task_database_operations.dart';

class EditTaskAddButton extends StatelessWidget {
  final TextEditingController taskEditingController;

  EditTaskAddButton({@required this.taskEditingController});

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
            addTask(_generateTask(taskName: taskEditingController.text));
            Navigator.pop(context);
          },
          child: Text('Add'),
        ),
      ),
    );
  }

  Task _generateTask({String taskName}) {
    return Task(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      dateCreated: Timestamp.now(),
      name: taskName,
      isComplete: false,
    );
  }
}
