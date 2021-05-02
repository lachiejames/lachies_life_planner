import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lachies_life_planner/homework_screen/bloc/assignments_bloc.dart';
import 'package:lachies_life_planner/homework_screen/bloc/assignments_event.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment_form.dart';
import 'package:lachies_life_planner/shared/widgets/sheet_text_button.dart';
import 'package:provider/provider.dart';

@immutable
class EditAssignmentAddButton extends StatelessWidget {
  final TextEditingController assignmentEditingController;

  const EditAssignmentAddButton({
    @required this.assignmentEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return SheetTextButton(
      text: 'Add',
      onPressed: () => _onPressed(context),
    );
  }

  void _onPressed(BuildContext context) {
    GlobalKey<FormState> formKey = Provider.of<AssignmentForm>(context, listen: false).formKey;
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      BlocProvider.of<AssignmentsBloc>(context).add(
        AddAssignmentEvent(Provider.of<AssignmentForm>(context, listen: false).toAssignment()),
      );

      Navigator.pop(context);
    }
  }
}
