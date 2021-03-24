import 'package:flutter/material.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment_database_operations.dart';
import 'package:lachies_life_planner/homework_screen/widgets/edit_assignment_widget/edit_assignment_sheet.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AssignmentWidget extends StatelessWidget {
  final Assignment assignment;

  AssignmentWidget({this.assignment}) : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Card(
        child: ListTile(
          onTap: () => showMaterialModalBottomSheet(
            context: context,
            builder: (BuildContext context) => EditAssignmentSheet(assignment: assignment),
          ),
          title: Text(assignment.title),
          leading: Checkbox(
            value: assignment.isComplete,
            onChanged: (bool value) => updateAssignment(assignment.copyWith(isComplete: value)),
          ),
        ),
      ),
    );
  }
}
