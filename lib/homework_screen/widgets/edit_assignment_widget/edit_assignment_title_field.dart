import 'package:flutter/material.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment.dart';
import 'package:lachies_life_planner/shared/config/size_config.dart';
import 'package:provider/provider.dart';

class EditAssignmentTitleField extends StatelessWidget {
  final String labelText;
  final String hintText;

  const EditAssignmentTitleField({
    @required this.labelText,
    @required this.hintText,
  });

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
          onSaved: (String currentTitle) {
            // Provider.of<Assignment>(context).
            print('need to update title here for provider');
          },
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: labelText,
            labelStyle: const TextStyle(color: Colors.black),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 3.0),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 3.0),
            ),
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}
