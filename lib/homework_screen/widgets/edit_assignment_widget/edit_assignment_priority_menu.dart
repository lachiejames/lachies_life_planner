import 'package:flutter/material.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment_form.dart';
import 'package:lachies_life_planner/shared/config/size_config.dart';
import 'package:provider/provider.dart';

class EditAssignmentPriorityMenu extends StatelessWidget {
  const EditAssignmentPriorityMenu();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        screenWidthUnit * 10,
        screenHeightUnit * 5,
        screenWidthUnit * 10,
        screenHeightUnit * 0,
      ),
      child: Center(
        child: DropdownButtonFormField(
          onSaved: (String selectedPriority) => _onSaved(context, selectedPriority),
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: 'Priority',
            labelStyle: const TextStyle(color: Colors.black),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 3.0),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 3.0),
            ),
            hintText: Provider.of<AssignmentForm>(context).priority ?? 'Choose a priority',
          ),
          items: _getPriorities(),
          onChanged: (String _) {},
        ),
      ),
    );
  }

  void _onSaved(BuildContext context, String selectedPriority) {
    Provider.of<AssignmentForm>(context, listen: false).priority = selectedPriority;
  }

  List<DropdownMenuItem<String>> _getPriorities() {
    return ['Choose a priority', 'High', 'Medium', 'Low']
        .map(
          (String option) => DropdownMenuItem<String>(
            value: option,
            child: Text(option),
          ),
        )
        .toList();
  }
}
