import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lachies_life_planner/homework_screen/bloc/assignments_bloc.dart';
import 'package:lachies_life_planner/homework_screen/bloc/assignments_event.dart';
import 'package:lachies_life_planner/homework_screen/models/assignments_repository.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/tasks_bloc.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/tasks_event.dart';
import 'package:lachies_life_planner/tasks_screen/models/tasks_repository.dart';

@immutable
class AllBlocProviders extends StatelessWidget {
  final Widget child;

  const AllBlocProviders({@required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TasksBloc>(
          create: (BuildContext context) => TasksBloc(tasksRepository: TasksRepository())..add(LoadTasksEvent()),
        ),
        BlocProvider<AssignmentsBloc>(
          create: (BuildContext context) => AssignmentsBloc(assignmentsRepository: AssignmentsRepository())..add(LoadAssignmentsEvent()),
        ),
      ],
      child: child,
    );
  }
}
