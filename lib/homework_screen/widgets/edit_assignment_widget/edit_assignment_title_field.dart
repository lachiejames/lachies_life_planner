import 'package:flutter/material.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment_form.dart';
import 'package:lachies_life_planner/shared/config/size_config.dart';
import 'package:provider/provider.dart';

class EditAssignmentTitleField extends StatelessWidget {
  const EditAssignmentTitleField();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        screenWidthUnit * 10,
        screenHeightUnit * 5,
        screenWidthUnit * 10,
        screenHeightUnit * 0,
      ),
      child: Center(
        child: TextFormField(
          initialValue: Provider.of<AssignmentForm>(context, listen: false).title ?? '',
          autofocus: true,
          onSaved: (String enteredTitle) => _onSaved(context, enteredTitle),
          decoration: const InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: 'Title',
            labelStyle: TextStyle(color: Colors.black),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 3.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 3.0),
            ),
            hintText: 'Enter a title',
          ),
        ),
      ),
    );
  }

  void _onSaved(BuildContext context, String enteredTitle) {
    Provider.of<AssignmentForm>(context, listen: false).title = enteredTitle;
  }
}
