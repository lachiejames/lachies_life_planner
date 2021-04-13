import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lachies_life_planner/homework_screen/bloc/assignments_bloc.dart';
import 'package:lachies_life_planner/homework_screen/bloc/assignments_event.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment.dart';
import 'package:lachies_life_planner/shared/widgets/sheet_text_button.dart';

@immutable
class EditAssignmentAddButton extends StatelessWidget {
  final TextEditingController assignmentEditingController;

  const EditAssignmentAddButton({@required this.assignmentEditingController});

  @override
  Widget build(BuildContext context) {
    return SheetTextButton(
      text: 'Add',
      onPressed: () => _onPressed(context),
    );
  }

  void _onPressed(BuildContext context) {
    Assignment newAssignment = _generateNewAssignment();
    BlocProvider.of<AssignmentsBloc>(context).add(AddAssignmentEvent(newAssignment));

    Navigator.pop(context);
  }

  Assignment _generateNewAssignment() {
    return Assignment(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      dateCreated: Timestamp.now(),
      title: assignmentEditingController.text,
      subject: 'Science',
      dueDate: Timestamp.now(),
      priority: 'medium',
      isComplete: false,
    );
  }
}
