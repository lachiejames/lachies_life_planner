import 'package:flutter/material.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment.dart';
import 'package:lachies_life_planner/homework_screen/models/new_assignment.dart';
import 'package:lachies_life_planner/homework_screen/widgets/edit_assignment_widget/edit_assignment_add_button.dart';
import 'package:lachies_life_planner/homework_screen/widgets/edit_assignment_widget/edit_assignment_cancel_button.dart';
import 'package:lachies_life_planner/homework_screen/widgets/edit_assignment_widget/edit_assignment_form.dart';
import 'package:lachies_life_planner/homework_screen/widgets/edit_assignment_widget/edit_assignment_update_button.dart';
import 'package:lachies_life_planner/shared/config/size_config.dart';
import 'package:provider/provider.dart';

class EditAssignmentSheet extends StatefulWidget {
  final Assignment assignment;

  const EditAssignmentSheet({this.assignment});

  @override
  _EditAssignmentWidgetState createState() => _EditAssignmentWidgetState();
}

class _EditAssignmentWidgetState extends State<EditAssignmentSheet> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
    return Provider<NewAssignment>(
      create: (BuildContext context) =>
          widget.assignment == null ? NewAssignment(formKey) : NewAssignment.fromAssignment(widget.assignment, formKey),
      builder: (BuildContext context, Widget widget) {
        return SizedBox(
          height: screenHeightUnit * 80,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                EditAssignmentForm(formKey: formKey),
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
          ),
        );
      },
    );
  }

  Widget _getPrimaryButton() {
    return widget.assignment == null
        ? Expanded(
            child: EditAssignmentAddButton(
              formKey: formKey,
              assignmentEditingController: _assignmentEditingController,
            ),
          )
        : Expanded(
            child: EditAssignmentUpdateButton(
              formKey: formKey,
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
