import 'package:flutter/material.dart';
import 'package:lachies_life_planner/shared/size_config.dart';

class EditTaskTextField extends StatelessWidget {
  final TextEditingController taskEditingController;

  EditTaskTextField({this.taskEditingController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: screenWidthUnit * 7),
      child: TextField(
        decoration: InputDecoration(border: InputBorder.none),
        autofocus: true,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        controller: taskEditingController,
      ),
    );
  }
}
