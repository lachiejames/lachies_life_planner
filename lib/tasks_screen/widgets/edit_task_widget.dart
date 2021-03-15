import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lachies_life_planner/shared/size_config.dart';
import 'package:lachies_life_planner/tasks_screen/models/task_database_operations.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';

class EditTaskWidget extends StatefulWidget {
  final Task task;

  EditTaskWidget({this.task});

  @override
  _EditTaskWidgetState createState() => _EditTaskWidgetState();
}

class _EditTaskWidgetState extends State<EditTaskWidget> {
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
          _EditTaskTextField(
            taskEditingController: _taskEditingController,
          ),
          Row(
            children: <Widget>[
              _EditTaskSecondaryOption(),
              _EditTaskPrimaryOption(
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

class _EditTaskPrimaryOption extends StatelessWidget {
  final Task task;
  final String newText;

  _EditTaskPrimaryOption({@required this.task, @required this.newText});

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

class _EditTaskSecondaryOption extends StatelessWidget {
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
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
      ),
    );
  }
}

class _EditTaskTextField extends StatelessWidget {
  final TextEditingController taskEditingController;

  _EditTaskTextField({this.taskEditingController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: screenWidthUnit * 7),
      child: TextField(
        decoration: InputDecoration(border: InputBorder.none),
        autofocus: true,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        controller: taskEditingController,
      ),
    );
  }
}
