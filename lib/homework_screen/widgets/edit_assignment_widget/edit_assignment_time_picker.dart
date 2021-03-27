import 'package:flutter/material.dart';
import 'package:lachies_life_planner/shared/config/size_config.dart';

class EditAssignmentTimePicker extends StatefulWidget {
  @override
  _EditAssignmentTimePickerState createState() => _EditAssignmentTimePickerState();
}

class _EditAssignmentTimePickerState extends State<EditAssignmentTimePicker> {
  TextEditingController _timePickerTextEditingController;

  @override
  void initState() {
    super.initState();
    _initTextController();
  }

  @override
  void dispose() {
    _timePickerTextEditingController.dispose();
    super.dispose();
  }

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
            onTap: () async => await _selectTimeFromTimePicker(),
            readOnly: true,
            controller: _timePickerTextEditingController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.alarm),
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

  void _initTextController() {
    _timePickerTextEditingController = TextEditingController.fromValue(
      TextEditingValue(
        text: '',
      ),
    );
  }

  Future<void> _selectTimeFromTimePicker() async {
    TimeOfDay selectedTime = await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (selectedTime != null) {
      _timePickerTextEditingController.text = '${selectedTime.hour}:${selectedTime.minute}';
    }
  }
}
