import 'package:flutter/material.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment_form.dart';
import 'package:lachies_life_planner/shared/config/size_config.dart';
import 'package:provider/provider.dart';

class EditAssignmentTimePicker extends StatelessWidget {
  const EditAssignmentTimePicker();

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
        onSaved: (String timeEntered) => _onSaved(context, timeEntered),
        onTap: () => _selectTimeFromTimePicker(context),
        readOnly: true,
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
          hintText: mapTimeToString(Provider.of<AssignmentForm>(context, listen: false).dueTime),
        ),
      ),
    );
  }

  void _onSaved(BuildContext context, String timeEntered) {
    Provider.of<AssignmentForm>(context, listen: false).dueTime = TimeOfDay.fromDateTime(DateTime.tryParse(timeEntered));
  }

  Future<void> _selectTimeFromTimePicker(BuildContext context) async {
    TimeOfDay selectedTime = await showTimePicker(
      context: context,
      initialTime: Provider.of<AssignmentForm>(context).dueTime ?? TimeOfDay.now(),
    );

    Provider.of<AssignmentForm>(context, listen: false).dueTime = selectedTime;
  }

  String mapTimeToString(TimeOfDay timeOfDay) {
    if (timeOfDay != null) {
      return '${timeOfDay.hourOfPeriod}:${timeOfDay.minute} ${timeOfDay.period == DayPeriod.am ? 'AM' : 'PM'}';
    } else {
      return 'hh:mm';
    }
  }
}
