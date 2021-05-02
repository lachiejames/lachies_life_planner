import 'package:flutter/material.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment_form.dart';
import 'package:lachies_life_planner/shared/config/size_config.dart';
import 'package:provider/provider.dart';

class EditAssignmentDatePicker extends StatefulWidget {
  const EditAssignmentDatePicker();

  @override
  _EditAssignmentDatePickerState createState() => _EditAssignmentDatePickerState();
}

class _EditAssignmentDatePickerState extends State<EditAssignmentDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        screenWidthUnit * 10,
        screenHeightUnit * 5,
        screenWidthUnit * 2.5,
        screenHeightUnit * 0,
      ),
      child: TextFormField(
        onTap: () => _selectDateFromDatePicker(context),
        readOnly: true,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: 'Due Date',
          labelStyle: const TextStyle(color: Colors.black),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 3.0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 3.0),
          ),
          hintText: _getHintText(context),
        ),
      ),
    );
  }

  Future<void> _selectDateFromDatePicker(BuildContext context) async {
    DateTime selectedDate = await showDatePicker(
      context: context,
      initialDate: Provider.of<AssignmentForm>(context, listen: false).dueDate ?? DateTime.now(),
      firstDate: DateTime.utc(1970),
      lastDate: DateTime.utc(2069, 4, 20),
    );

    setState(() {
      Provider.of<AssignmentForm>(context, listen: false).dueDate = selectedDate;
    });
  }

  String _getHintText(BuildContext context) {
    DateTime dateTime = Provider.of<AssignmentForm>(context).dueDate;
    if (dateTime != null) {
      return _mapDateToString(dateTime);
    } else {
      return 'dd/mm/yyyy';
    }
  }

  String _mapDateToString(DateTime dateTime) {
    String day = dateTime?.day?.toString()?.padLeft(2, '0');
    String month = dateTime?.month?.toString()?.padLeft(2, '0');
    String year = dateTime?.year?.toString();
    return '$day/$month/$year';
  }
}
