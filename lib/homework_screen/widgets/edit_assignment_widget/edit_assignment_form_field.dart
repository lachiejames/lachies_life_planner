import 'package:flutter/material.dart';
import 'package:lachies_life_planner/shared/config/size_config.dart';

final editAssignmentformKey = GlobalKey<FormState>();

class EditAssignmentFormField extends StatelessWidget {
  final String labelText;
  final String hintText;

  EditAssignmentFormField({
    @required this.labelText,
    @required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(screenWidthUnit * 10),
      child: Center(
        child: TextFormField(
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.black),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 3.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 3.0),
            ),
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}
