import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lachies_life_planner/shared/widgets/sheet_text_button.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/tasks_bloc.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/tasks_event.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';

class EditTaskUpdateButton extends StatelessWidget {
  final Task taskToUpdate;
  final TextEditingController taskEditingController;

  EditTaskUpdateButton({@required this.taskToUpdate, @required this.taskEditingController}) : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    return SheetTextButton(
      text: 'Update',
      onPressed: () => _onPressed(context),
    );
  }

  void _onPressed(BuildContext context) {
    Task updatedTask = taskToUpdate.copyWith(name: taskEditingController.text);
    BlocProvider.of<TasksBloc>(context).add(UpdateTaskEvent(updatedTask));

    Navigator.pop(context);
  }
}
