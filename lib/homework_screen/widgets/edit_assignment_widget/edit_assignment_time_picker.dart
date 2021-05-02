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
        onTap: () => _selectTimeFromTimePicker(context),
        readOnly: true,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: 'Due Time',
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

  Future<void> _selectTimeFromTimePicker(BuildContext context) async {
    TimeOfDay selectedTime = await showTimePicker(
      context: context,
      initialTime: Provider.of<AssignmentForm>(context, listen: false).dueTime ?? TimeOfDay.now(),
    );

    setState(() {
      Provider.of<AssignmentForm>(context, listen: false).dueTime = selectedTime;
    });
  }

  String _getHintText(BuildContext context) {
    TimeOfDay timeOfDay = Provider.of<AssignmentForm>(context).dueTime;
    if (timeOfDay != null) {
      return _mapTimeToString(timeOfDay);
    } else {
      return 'hh:mm';
    }
  }

  String _mapTimeToString(TimeOfDay timeOfDay) {
    String hour = timeOfDay?.hourOfPeriod?.toString()?.padLeft(2, '0');
    String minute = timeOfDay?.minute?.toString()?.padLeft(2, '0');
    String period = timeOfDay?.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }
}
