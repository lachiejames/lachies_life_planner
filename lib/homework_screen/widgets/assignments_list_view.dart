import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lachies_life_planner/homework_screen/bloc/assignments_bloc.dart';
import 'package:lachies_life_planner/homework_screen/bloc/assignments_state.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment.dart';
import 'package:lachies_life_planner/homework_screen/widgets/assignment_widget.dart';

@immutable
class AssignmentsListView extends StatelessWidget {
  const AssignmentsListView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssignmentsBloc, AssignmentsState>(
      builder: (BuildContext context, AssignmentsState state) {
        if (state is AssignmentsLoadingState) {
          return _getAssignmentsLoadingView();
        } else if (state is AssignmentsLoadedState) {
          return _getAssignmentsLoadedView(state.assignments);
        } else {
          return _getAssignmentsErrorView();
        }
      },
    );
  }

  Widget _getAssignmentsLoadingView() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _getAssignmentsLoadedView(List<Assignment> assignments) {
    return ListView(
      children: assignments.map((Assignment assignment) => AssignmentWidget(assignment: assignment)).toList(),
    );
  }

  Widget _getAssignmentsErrorView() {
    return const Center(
      child: Text('something went wrong :('),
    );
  }
}
