import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lachies_life_planner/homework_screen/bloc/assignments_bloc.dart';
import 'package:lachies_life_planner/homework_screen/bloc/assignments_event.dart';
import 'package:lachies_life_planner/homework_screen/widgets/add_assignment_button.dart';
import 'package:lachies_life_planner/homework_screen/widgets/assignments_list_view.dart';
import 'package:lachies_life_planner/shared/widgets/app_bar_overflow_menu.dart';

@immutable
class HomeworkScreen extends StatelessWidget {
  const HomeworkScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homework'),
        actions: [
          AppBarOverflowMenu(
            menuOptions: {
              'Delete All Assignments': () => _deleteAllAssignments(context),
            },
          ),
        ],
      ),
      floatingActionButton: const AddAssignmentButton(),
      body: const AssignmentsListView(),
    );
  }

  void _deleteAllAssignments(BuildContext context) {
    BlocProvider.of<AssignmentsBloc>(context).add(DeleteAllAssignmentsEvent());
  }
}
