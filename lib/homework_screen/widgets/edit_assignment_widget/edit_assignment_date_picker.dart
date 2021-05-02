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
  TextEditingController _datePickerTextEditingController;
  DateTime _currentDateEntered;

  @override
  void initState() {
    super.initState();
    _initTextController();
  }

  @override
  void dispose() {
    _datePickerTextEditingController.dispose();
    super.dispose();
  }

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
        onSaved: (String _) {
          Provider.of<AssignmentForm>(context, listen: false).dueDate = _currentDateEntered;
        },
        onTap: () => _selectDateFromDatePicker(),
        readOnly: true,
        controller: _datePickerTextEditingController,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.calendar_today),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: 'Due Date',
          labelStyle: const TextStyle(color: Colors.black),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 3.0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 3.0),
          ),
          hintText: mapDateToString(Provider.of<AssignmentForm>(context).dueDate),
        ),
      ),
    );
  }

  void _initTextController() {
    _datePickerTextEditingController = TextEditingController.fromValue(
      const TextEditingValue(
        text: '',
      ),
    );
  }

  Future<void> _selectDateFromDatePicker() async {
    DateTime selectedDate = await showDatePicker(
      context: context,
      initialDate: _currentDateEntered ?? DateTime.now(),
      firstDate: DateTime.utc(1970),
      lastDate: DateTime.utc(2069, 4, 20),
    );
    if (selectedDate != null) {
      _currentDateEntered = selectedDate;
      _datePickerTextEditingController.text = mapDateToString(selectedDate);
    }
  }

  String mapDateToString(DateTime dateTime) {
    if (dateTime != null) {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    } else {
      return 'dd/mm/yy';
    }
  }
}
