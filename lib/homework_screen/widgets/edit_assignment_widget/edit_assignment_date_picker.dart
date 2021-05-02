import 'package:flutter/material.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment_form.dart';
import 'package:lachies_life_planner/shared/config/size_config.dart';
import 'package:provider/provider.dart';

class EditAssignmentDatePicker extends StatelessWidget {
  const EditAssignmentDatePicker();

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
        onSaved: (String dateEntered) => _onSaved(context, dateEntered),
        onTap: () => _selectDateFromDatePicker(context),
        readOnly: true,
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
          hintText: _getHintText(context),
        ),
      ),
    );
  }

  void _onSaved(BuildContext context, String dateEntered) {
    Provider.of<AssignmentForm>(context, listen: false).dueDate = DateTime.tryParse(dateEntered);
  }

  Future<void> _selectDateFromDatePicker(BuildContext context) async {
    DateTime selectedDate = await showDatePicker(
      context: context,
      initialDate: Provider.of<AssignmentForm>(context, listen: false).dueDate ?? DateTime.now(),
      firstDate: DateTime.utc(1970),
      lastDate: DateTime.utc(2069, 4, 20),
    );

    Provider.of<AssignmentForm>(context, listen: false).dueDate = selectedDate;
  }

  String _getHintText(BuildContext context) {
    DateTime dateTime = Provider.of<AssignmentForm>(context).dueDate;
    if (dateTime != null) {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    } else {
      return 'dd/mm/yy';
    }
  }
}
