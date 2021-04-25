import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lachies_life_planner/homework_screen/bloc/assignments_bloc.dart';
import 'package:lachies_life_planner/homework_screen/bloc/assignments_event.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment.dart';
import 'package:lachies_life_planner/homework_screen/models/new_assignment.dart';
import 'package:lachies_life_planner/shared/widgets/sheet_text_button.dart';
import 'package:provider/provider.dart';

class EditAssignmentUpdateButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Assignment assignmentToUpdate;
  final TextEditingController assignmentEditingController;

  EditAssignmentUpdateButton({
    @required this.assignmentToUpdate,
    @required this.assignmentEditingController,
    @required this.formKey,
  }) : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    return SheetTextButton(
      text: 'Update',
      onPressed: () => _onPressed(context),
    );
  }

  void _onPressed(BuildContext context) {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      BlocProvider.of<AssignmentsBloc>(context).add(
        AddAssignmentEvent(Provider.of<NewAssignment>(context, listen: false).toAssignment()),
      );

      Navigator.pop(context);
    }
  }
}
