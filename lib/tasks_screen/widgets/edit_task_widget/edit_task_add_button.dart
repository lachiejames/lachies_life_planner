import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lachies_life_planner/shared/widgets/sheet_text_button.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/task_bloc.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';

class EditTaskAddButton extends StatelessWidget {
  final TextEditingController taskEditingController;

  EditTaskAddButton({@required this.taskEditingController}) : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    return SheetTextButton(
      text: 'Add',
      onPressed: () {
        BlocProvider.of<TasksBloc>(context).tasksRepository.addTask(_generateTask(taskName: taskEditingController.text));
        Navigator.pop(context);
      },
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
