import 'package:flutter/material.dart';
import 'package:lachies_life_planner/shared/widgets/sheet_text_button.dart';

@immutable
class EditAssignmentCancelButton extends StatelessWidget {
  const EditAssignmentCancelButton();

  @override
  Widget build(BuildContext context) {
    return SheetTextButton(
      text: 'Cancel',
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
