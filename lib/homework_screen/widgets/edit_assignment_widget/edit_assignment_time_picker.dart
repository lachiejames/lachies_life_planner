import 'package:flutter/material.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment_form.dart';
import 'package:lachies_life_planner/shared/config/size_config.dart';
import 'package:provider/provider.dart';

class EditAssignmentTimePicker extends StatefulWidget {
  const EditAssignmentTimePicker();

  @override
  _EditAssignmentTimePickerState createState() => _EditAssignmentTimePickerState();
}

class _EditAssignmentTimePickerState extends State<EditAssignmentTimePicker> {
  TextEditingController _timePickerTextEditingController;
  TimeOfDay _currentTimeEntered;

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
    return Container(
      margin: EdgeInsets.fromLTRB(
        screenWidthUnit * 2.5,
        screenHeightUnit * 5,
        screenWidthUnit * 10,
        screenHeightUnit * 0,
      ),
      child: TextFormField(
        onSaved: (String _) => _onSaved(),
        onTap: () => _selectTimeFromTimePicker(),
        readOnly: true,
        controller: _timePickerTextEditingController,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.alarm),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: 'Due Time',
          labelStyle: const TextStyle(color: Colors.black),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 3.0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 3.0),
          ),
          hintText: mapTimeToString(Provider.of<AssignmentForm>(context).dueTime),
        ),
      ),
    );
  }

  void _initTextController() {
    _timePickerTextEditingController = TextEditingController.fromValue(
      const TextEditingValue(
        text: '',
      ),
    );
  }

  void _onSaved() {
    Provider.of<AssignmentForm>(context, listen: false).dueTime = _currentTimeEntered;
  }

  Future<void> _selectTimeFromTimePicker() async {
    TimeOfDay selectedTime = await showTimePicker(
      context: context,
      initialTime: _currentTimeEntered ?? TimeOfDay.now(),
    );
    if (selectedTime != null) {
      _currentTimeEntered = selectedTime;
      _timePickerTextEditingController.text = _getTimeString(selectedTime);
    }
  }

  String _getTimeString(TimeOfDay selectedTime) {
    return '${selectedTime.hourOfPeriod}:${selectedTime.minute} ${selectedTime.period == DayPeriod.am ? 'AM' : 'PM'}';
  }

  String mapTimeToString(TimeOfDay timeOfDay) {
    if (timeOfDay != null) {
      return '${timeOfDay.hourOfPeriod}:${timeOfDay.minute} ${timeOfDay.period == DayPeriod.am ? 'AM' : 'PM'}';
    } else {
      return 'hh:mm';
    }
  }
}
