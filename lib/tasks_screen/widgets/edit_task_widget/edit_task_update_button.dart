import 'package:flutter/material.dart';
import 'package:lachies_life_planner/shared/widgets/sheet_text_button.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';
import 'package:lachies_life_planner/tasks_screen/models/task_database_operations.dart';

class EditTaskUpdateButton extends StatelessWidget {
  final Task taskToUpdate;
  final TextEditingController taskEditingController;

  EditTaskUpdateButton({@required this.taskToUpdate, @required this.taskEditingController}) : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    return SheetTextButton(
      text: 'Update',
      onPressed: () {
        updateTask(taskToUpdate.copyWith(name: taskEditingController.text));
        Navigator.pop(context);
      },
    );
  }
}
