import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment_database_operations.dart';
import 'package:lachies_life_planner/shared/widgets/sheet_text_button.dart';

class EditAssignmentAddButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  final TextEditingController assignmentEditingController;

  EditAssignmentAddButton({
    @required this.formKey,
    @required this.assignmentEditingController,
  }) : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    return SheetTextButton(
      text: 'Add',
      onPressed: () {
        if (formKey.currentState.validate()) {
          addAssignment(_generateAssignment(assignmentName: assignmentEditingController.text));
          Navigator.pop(context);
        }
      },
    );
  }

  Assignment _generateAssignment({String assignmentName}) {
    return Assignment(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      dateCreated: Timestamp.now(),
      title: assignmentName,
      subject: '',
      dueDate: Timestamp(1234567890, 0),
      priority: '',
      isComplete: false,
    );
  }
}
