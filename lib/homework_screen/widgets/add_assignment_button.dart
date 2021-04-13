import 'package:flutter/material.dart';
import 'package:lachies_life_planner/homework_screen/widgets/edit_assignment_widget/edit_assignment_sheet.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

@immutable
class AddAssignmentButton extends StatelessWidget {
  const AddAssignmentButton();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: FloatingActionButton(
        onPressed: () => _onPressed(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _onPressed(BuildContext context) {
    showMaterialModalBottomSheet(
      context: context,
      builder: (BuildContext context) => const EditAssignmentSheet(),
    );
  }
}
