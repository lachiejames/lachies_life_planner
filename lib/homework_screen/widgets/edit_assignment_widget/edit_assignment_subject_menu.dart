import 'package:flutter/material.dart';
import 'package:lachies_life_planner/homework_screen/models/new_assignment.dart';
import 'package:lachies_life_planner/shared/config/size_config.dart';
import 'package:provider/provider.dart';

class EditAssignmentSubjectMenu extends StatelessWidget {
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
        child: DropdownButtonFormField(
          onSaved: (String selectedSubject) {
            Provider.of<NewAssignment>(context, listen: false).subject = selectedSubject;
          },
          decoration: const InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: 'Subject',
            labelStyle: TextStyle(color: Colors.black),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 3.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 3.0),
            ),
            hintText: 'Choose a subject',
          ),
          items: ['Choose a subject', 'Maths', 'English']
              .map((String option) => DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  ))
              .toList(),
          onChanged: (String _) {},
        ),
      ),
    );
  }
}
