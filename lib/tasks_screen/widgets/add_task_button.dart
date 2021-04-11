import 'package:flutter/material.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/edit_task_widget/edit_task_sheet.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

@immutable
class AddTaskButton extends StatelessWidget {
  AddTaskButton() : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: FloatingActionButton(
        onPressed: () => _onPressed(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _onPressed(BuildContext context) {
    showMaterialModalBottomSheet(
      context: context,
      builder: (BuildContext context) => EditTaskSheet(),
    );
  }
}
