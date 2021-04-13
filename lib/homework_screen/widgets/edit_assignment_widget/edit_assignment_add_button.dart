import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lachies_life_planner/homework_screen/bloc/assignments_bloc.dart';
import 'package:lachies_life_planner/homework_screen/bloc/assignments_event.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment.dart';
import 'package:lachies_life_planner/shared/widgets/sheet_text_button.dart';
import 'package:provider/provider.dart';

@immutable
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
      onPressed: () => _onPressed(context),
    );
  }

  void _onPressed(BuildContext context) {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      BlocProvider.of<AssignmentsBloc>(context).add(AddAssignmentEvent(_generateNewAssignment(context)));

      Navigator.pop(context);
    }
  }

  Assignment _generateNewAssignment(BuildContext context) {
    return Assignment(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      dateCreated: Timestamp.now(),
      title: Provider.of<Assignment>(context, listen: false).title ?? '',
      subject: Provider.of<Assignment>(context, listen: false).subject ?? '',
      dueDate: Provider.of<Assignment>(context, listen: false).dueDate ?? Timestamp(0, 0),
      priority: Provider.of<Assignment>(context, listen: false).priority ?? '',
      isComplete: false,
    );
  }
}
