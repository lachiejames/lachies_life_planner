import 'package:flutter/material.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/edit_task_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AddTaskButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showMaterialModalBottomSheet(
        context: context,
        builder: (BuildContext context) => EditTaskWidget(),
      ),
      child: Icon(Icons.add),
    );
  }
}