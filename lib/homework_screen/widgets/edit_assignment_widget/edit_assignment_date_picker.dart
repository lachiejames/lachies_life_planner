import 'package:flutter/material.dart';
import 'package:lachies_life_planner/shared/config/size_config.dart';

class EditAssignmentDatePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.fromLTRB(
          screenWidthUnit * 10,
          screenHeightUnit * 5,
          screenWidthUnit * 2.5,
          screenHeightUnit * 0,
        ),
        child: Center(
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: GestureDetector(
                onTap: () async => await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.utc(1970),
                  lastDate: DateTime.utc(2069, 4, 20),
                ),
                child: Icon(Icons.calendar_today),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: 'Due Date',
              labelStyle: TextStyle(color: Colors.black),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 3.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 3.0),
              ),
              hintText: 'dd/mm/yy',
            ),
          ),
        ),
      ),
    );
  }
}
