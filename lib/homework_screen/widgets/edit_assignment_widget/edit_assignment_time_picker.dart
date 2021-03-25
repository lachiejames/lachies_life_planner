import 'package:flutter/material.dart';
import 'package:lachies_life_planner/shared/config/size_config.dart';

class EditAssignmentTimePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.fromLTRB(
          screenWidthUnit * 2.5,
          screenHeightUnit * 5,
          screenWidthUnit * 10,
          screenHeightUnit * 0,
        ),
        child: Center(
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: GestureDetector(
                onTap: () async => await showTimePicker(context: context, initialTime: TimeOfDay.now()),
                child: Icon(Icons.alarm),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: 'Due Time',
              labelStyle: TextStyle(color: Colors.black),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 3.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 3.0),
              ),
              hintText: 'hh:mm',
            ),
          ),
        ),
      ),
    );
  }
}
