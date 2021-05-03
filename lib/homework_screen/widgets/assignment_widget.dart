import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lachies_life_planner/homework_screen/bloc/assignments_bloc.dart';
import 'package:lachies_life_planner/homework_screen/bloc/assignments_event.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment.dart';
import 'package:lachies_life_planner/homework_screen/widgets/edit_assignment_widget/edit_assignment_sheet.dart';
import 'package:lachies_life_planner/shared/utils/date-utils.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

const Color greyColor = Color.fromARGB(120, 0, 0, 0);

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
          title: Text(assignment?.title ?? ''),
          subtitle: Text(
            assignment?.subject ?? '',
            style: const TextStyle(color: greyColor),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                mapDateToString(assignment?.dueDate) ?? '',
                style: const TextStyle(color: greyColor),
              ),
              Text(
                mapDateToTimeString(assignment?.dueDate) ?? '',
                style: const TextStyle(color: greyColor),
              )
            ],
          ),
          leading: Transform.scale(
            scale: 1.5,
            child: Checkbox(
              value: assignment.isComplete,
              onChanged: (bool isChecked) => _onCheckboxTapped(isChecked, context),
            ),
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
