import 'package:flutter/material.dart';
import 'package:lachies_life_planner/homework_screen/widgets/edit_assignment_widget/form/edit_assignment_date_picker.dart';
import 'package:lachies_life_planner/homework_screen/widgets/edit_assignment_widget/form/edit_assignment_title_field.dart';
import 'package:lachies_life_planner/homework_screen/widgets/edit_assignment_widget/form/edit_assignment_priority_menu.dart';
import 'package:lachies_life_planner/homework_screen/widgets/edit_assignment_widget/form/edit_assignment_subject_menu.dart';
import 'package:lachies_life_planner/homework_screen/widgets/edit_assignment_widget/form/edit_assignment_time_picker.dart';

class EditAssignmentForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  EditAssignmentForm({@required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          EditAssignmentTitleField(
            labelText: 'Title',
            hintText: 'Enter a title',
          ),
          EditAssignmentSubjectMenu(),
          Row(
            children: [
              Expanded(
                child: EditAssignmentDatePicker(),
              ),
              Expanded(
                child: EditAssignmentTimePicker(),
              ),
            ],
          ),
          EditAssignmentPriorityMenu(),
        ],
      ),
    );
  }
}
