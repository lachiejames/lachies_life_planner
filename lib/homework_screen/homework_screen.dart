import 'package:flutter/material.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment_database_operations.dart';
import 'package:lachies_life_planner/homework_screen/widgets/add_assignment_button.dart';
import 'package:lachies_life_planner/homework_screen/widgets/assignment_list_view.dart';
import 'package:lachies_life_planner/shared/widgets/app_bar_overflow_menu.dart';

class HomeworkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homework'),
        actions: [
          AppBarOverflowMenu(
            menuOptions: {
              'Delete All Assignments': () => deleteAllAssignments(),
            },
          ),
        ],
      ),
      floatingActionButton: AddAssignmentButton(),
      body: AssignmentListView(),
    );
  }
}
