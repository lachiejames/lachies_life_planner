import 'package:flutter/material.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment_form.dart';
import 'package:lachies_life_planner/shared/config/size_config.dart';
import 'package:provider/provider.dart';

class EditAssignmentSubjectMenu extends StatelessWidget {
  const EditAssignmentSubjectMenu();

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
          onSaved: (String selectedSubject) => _onSaved(context, selectedSubject),
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: 'Subject',
            labelStyle: const TextStyle(color: Colors.black),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 3.0),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 3.0),
            ),
            hintText: Provider.of<AssignmentForm>(context).subject ?? 'Choose a subject',
          ),
          items: getSubjects(),
          onChanged: (String _) {},
        ),
      ),
    );
  }

  void _onSaved(BuildContext context, String selectedSubject) {
    Provider.of<AssignmentForm>(context, listen: false).subject = selectedSubject;
  }

  List<DropdownMenuItem<String>> getSubjects() {
    return ['Choose a subject', 'Maths', 'English']
        .map(
          (String option) => DropdownMenuItem<String>(
            value: option,
            child: Text(option),
          ),
        )
        .toList();
  }
}
