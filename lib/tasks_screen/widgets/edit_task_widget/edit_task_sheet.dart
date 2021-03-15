import 'package:flutter/material.dart';
import 'package:lachies_life_planner/shared/size_config.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/edit_task_widget/edit_task_add_button.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/edit_task_widget/edit_task_cancel_button.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/edit_task_widget/edit_task_text_field.dart';

class EditTaskSheet extends StatefulWidget {
  final Task task;

  EditTaskSheet({this.task});

  @override
  _EditTaskWidgetState createState() => _EditTaskWidgetState();
}

class _EditTaskWidgetState extends State<EditTaskSheet> {
  TextEditingController _taskEditingController;

  @override
  void initState() {
    super.initState();
    _initTextController();
  }

  @override
  void dispose() {
    _taskEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeightUnit * 65,
      child: Column(
        children: <Widget>[
          EditTaskTextField(
            taskEditingController: _taskEditingController,
          ),
          Row(
            children: <Widget>[
              EditTaskCancelButton(),
              EditTaskAddButton(
                task: widget.task,
                newText: _taskEditingController.text,
              ),
            ],
          )
        ],
      ),
    );
  }

  void _initTextController() {
    _taskEditingController = TextEditingController.fromValue(
      TextEditingValue(
        text: widget.task?.name ?? '',
      ),
    );
  }
}
