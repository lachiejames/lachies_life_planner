import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lachies_life_planner/homework_screen/bloc/assignments_bloc.dart';
import 'package:lachies_life_planner/homework_screen/bloc/assignments_event.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment.dart';
import 'package:lachies_life_planner/homework_screen/widgets/edit_assignment_widget/edit_assignment_sheet.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

@immutable
class AssignmentWidget extends StatelessWidget {
  final Assignment assignment;

  const AssignmentWidget({this.assignment});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Card(
        child: ListTile(
          onTap: () => _onListTileTapped(context),
          title: Text(assignment.title),
          leading: Checkbox(
            value: assignment.isComplete,
            onChanged: (bool isChecked) => _onCheckboxTapped(isChecked, context),
          ),
        ),
      ),
    );
  }

  void _onListTileTapped(BuildContext context) {
    showMaterialModalBottomSheet(
      context: context,
      builder: (BuildContext context) => EditAssignmentSheet(assignment: assignment),
    );
  }

  void _onCheckboxTapped(bool isChecked, BuildContext context) {
    Assignment updatedAssignment = assignment.copyWith(isComplete: isChecked);
    BlocProvider.of<AssignmentsBloc>(context).add(UpdateAssignmentEvent(updatedAssignment));
  }
}
