import 'package:flutter/material.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment_database_operations.dart';
import 'package:lachies_life_planner/shared/widgets/sheet_text_button.dart';

class EditAssignmentUpdateButton extends StatelessWidget {
  final Assignment assignmentToUpdate;
  final TextEditingController assignmentEditingController;

  EditAssignmentUpdateButton({@required this.assignmentToUpdate, @required this.assignmentEditingController}) : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    return SheetTextButton(
      text: 'Update',
      onPressed: () {
        updateAssignment(assignmentToUpdate.copyWith(title: assignmentEditingController.text));
        Navigator.pop(context);
      },
    );
  }
}
