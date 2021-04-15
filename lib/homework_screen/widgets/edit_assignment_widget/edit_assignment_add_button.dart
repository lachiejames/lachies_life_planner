import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lachies_life_planner/homework_screen/bloc/assignments_bloc.dart';
import 'package:lachies_life_planner/homework_screen/bloc/assignments_event.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment.dart';
import 'package:lachies_life_planner/homework_screen/models/new_assignment.dart';
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

  Timestamp _getDueDate(BuildContext context) {
    DateTime dueDate = Provider.of<NewAssignment>(context, listen: false).dueDate;
    TimeOfDay dueTime = Provider.of<NewAssignment>(context, listen: false).dueTime;
    dueDate?.add(Duration(hours: dueTime?.hour, minutes: dueTime?.minute));

    if (dueDate != null) {
      return Timestamp.fromDate(dueDate);
    } else {
      return null;
    }
  }

  Assignment _generateNewAssignment(BuildContext context) {
    return Assignment(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      dateCreated: Timestamp.now(),
      title: Provider.of<NewAssignment>(context, listen: false).title,
      subject: Provider.of<NewAssignment>(context, listen: false).subject,
      dueDate: _getDueDate(context),
      priority: Provider.of<NewAssignment>(context, listen: false).priority,
      isComplete: false,
    );
  }
}
