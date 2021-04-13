import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lachies_life_planner/homework_screen/bloc/assignments_bloc.dart';
import 'package:lachies_life_planner/homework_screen/bloc/assignments_event.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment.dart';
import 'package:lachies_life_planner/shared/widgets/sheet_text_button.dart';

@immutable
class EditAssignmentUpdateButton extends StatelessWidget {
  final Assignment assignmentToUpdate;
  final TextEditingController assignmentEditingController;

  const EditAssignmentUpdateButton({@required this.assignmentToUpdate, @required this.assignmentEditingController});

  @override
  Widget build(BuildContext context) {
    return SheetTextButton(
      text: 'Update',
      onPressed: () => _onPressed(context),
    );
  }

  void _onPressed(BuildContext context) {
    Assignment updatedAssignment = assignmentToUpdate.copyWith(title: assignmentEditingController.text);
    BlocProvider.of<AssignmentsBloc>(context).add(UpdateAssignmentEvent(updatedAssignment));

    Navigator.pop(context);
  }
}
