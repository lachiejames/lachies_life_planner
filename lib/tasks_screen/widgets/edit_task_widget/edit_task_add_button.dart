import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lachies_life_planner/shared/widgets/sheet_text_button.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/tasks_bloc.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/tasks_event.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';

@immutable
class EditTaskAddButton extends StatelessWidget {
  final TextEditingController taskEditingController;

  const EditTaskAddButton({@required this.taskEditingController});

  @override
  Widget build(BuildContext context) {
    return SheetTextButton(
      text: 'Add',
      onPressed: () => _onPressed(context),
    );
  }

  void _onPressed(BuildContext context) {
    Task newTask = _generateNewTask();
    BlocProvider.of<TasksBloc>(context).add(AddTaskEvent(newTask));

    Navigator.pop(context);
  }

  Task _generateNewTask() {
    return Task(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      dateCreated: Timestamp.now(),
      name: taskEditingController.text,
      isComplete: false,
    );
  }
}
