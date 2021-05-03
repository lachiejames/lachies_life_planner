import 'package:flutter/material.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment_form.dart';
import 'package:lachies_life_planner/homework_screen/widgets/edit_assignment_widget/edit_assignment_date_picker.dart';
import 'package:lachies_life_planner/homework_screen/widgets/edit_assignment_widget/edit_assignment_priority_menu.dart';
import 'package:lachies_life_planner/homework_screen/widgets/edit_assignment_widget/edit_assignment_subject_menu.dart';
import 'package:lachies_life_planner/homework_screen/widgets/edit_assignment_widget/edit_assignment_time_picker.dart';
import 'package:lachies_life_planner/homework_screen/widgets/edit_assignment_widget/edit_assignment_title_field.dart';
import 'package:provider/provider.dart';

class EditAssignmentForm extends StatelessWidget {
  const EditAssignmentForm();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: Provider.of<AssignmentForm>(context, listen: false).formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const EditAssignmentTitleField(),
          const EditAssignmentSubjectMenu(),
          Row(
            children: const [
              Expanded(
                child: EditAssignmentDatePicker(),
              ),
              Expanded(
                child: EditAssignmentTimePicker(),
              ),
            ],
          ),
          const EditAssignmentPriorityMenu(),
        ],
      ),
    );
  }
}
