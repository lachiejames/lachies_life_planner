import 'package:flutter/material.dart';
import 'package:lachies_life_planner/shared/config/size_config.dart';

@immutable
class EditAssignmentTextField extends StatelessWidget {
  final TextEditingController assignmentEditingController;

  const EditAssignmentTextField({this.assignmentEditingController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: screenWidthUnit * 7),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: TextField(
          decoration: const InputDecoration(border: InputBorder.none),
          autofocus: true,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          controller: assignmentEditingController,
        ),
      ),
    );
  }
}