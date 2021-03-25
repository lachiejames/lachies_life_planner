import 'package:flutter/material.dart';
import 'package:lachies_life_planner/homework_screen/widgets/edit_assignment_widget/edit_assignment_form_field.dart';

class EditAssignmentForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: editAssignmentformKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          EditAssignmentFormField(
            labelText: 'Title',
            hintText: 'Enter a title',
          ),
        ],
      ),
    );
  }
}
