import 'package:flutter/material.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment.dart';
import 'package:lachies_life_planner/homework_screen/widgets/edit_assignment_widget/edit_assignment_add_button.dart';
import 'package:lachies_life_planner/homework_screen/widgets/edit_assignment_widget/edit_assignment_cancel_button.dart';
import 'package:lachies_life_planner/homework_screen/widgets/edit_assignment_widget/edit_assignment_text_field.dart';
import 'package:lachies_life_planner/homework_screen/widgets/edit_assignment_widget/edit_assignment_update_button.dart';
import 'package:lachies_life_planner/shared/config/size_config.dart';

@immutable
class EditAssignmentSheet extends StatefulWidget {
  final Assignment assignment;

  const EditAssignmentSheet({this.assignment});

  @override
  _EditAssignmentWidgetState createState() => _EditAssignmentWidgetState();
}

class _EditAssignmentWidgetState extends State<EditAssignmentSheet> {
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
    return SizedBox(
      height: screenHeightUnit * 65,
      child: Column(
        children: <Widget>[
          EditAssignmentTextField(
            assignmentEditingController: _assignmentEditingController,
          ),
          Row(
            children: <Widget>[
              const Expanded(
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
              assignmentEditingController: _assignmentEditingController,
            ),
          )
        : Expanded(
            child: EditAssignmentUpdateButton(
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
