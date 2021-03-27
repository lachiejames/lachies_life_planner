import 'package:flutter/material.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment.dart';
import 'package:lachies_life_planner/homework_screen/widgets/edit_assignment_widget/edit_assignment_add_button.dart';
import 'package:lachies_life_planner/homework_screen/widgets/edit_assignment_widget/edit_assignment_cancel_button.dart';
import 'package:lachies_life_planner/homework_screen/widgets/edit_assignment_widget/edit_assignment_form.dart';
import 'package:lachies_life_planner/homework_screen/widgets/edit_assignment_widget/edit_assignment_update_button.dart';
import 'package:lachies_life_planner/shared/config/size_config.dart';

class EditAssignmentSheet extends StatefulWidget {
  final Assignment assignment;

  EditAssignmentSheet({this.assignment});

  @override
  _EditAssignmentWidgetState createState() => _EditAssignmentWidgetState();
}

class _EditAssignmentWidgetState extends State<EditAssignmentSheet> {
  final GlobalKey<FormState> editAssignmentformKey = GlobalKey<FormState>();
  TextEditingController _assignmentEditingController;

  @override
  void initState() {
    super.initState();
    _initTextController();
  }

  @override
  void dispose() {
    _assignmentEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeightUnit * 80,
      child: Column(
        children: <Widget>[
          EditAssignmentForm(formKey: editAssignmentformKey),
          Row(
            children: <Widget>[
              Expanded(
                child: EditAssignmentCancelButton(),
              ),
              _getPrimaryButton(),
            ],
          )
        ],
      ),
    );
  }

  Widget _getPrimaryButton() {
    return widget.assignment == null
        ? Expanded(
            child: EditAssignmentAddButton(
              formKey: editAssignmentformKey,
              assignmentEditingController: _assignmentEditingController,
            ),
          )
        : Expanded(
            child: EditAssignmentUpdateButton(
              formKey: editAssignmentformKey,
              assignmentToUpdate: widget.assignment,
              assignmentEditingController: _assignmentEditingController,
            ),
          );
  }

  void _initTextController() {
    _assignmentEditingController = TextEditingController.fromValue(
      TextEditingValue(
        text: widget.assignment?.title ?? '',
      ),
    );
  }
}
