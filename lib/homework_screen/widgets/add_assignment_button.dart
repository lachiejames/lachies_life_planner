import 'package:flutter/material.dart';
import 'package:lachies_life_planner/homework_screen/widgets/edit_assignment_widget/edit_assignment_sheet.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AddAssignmentButton extends StatelessWidget {
  AddAssignmentButton() : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: FloatingActionButton(
        onPressed: () => showMaterialModalBottomSheet(
          context: context,
          builder: (BuildContext context) => EditAssignmentSheet(),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
