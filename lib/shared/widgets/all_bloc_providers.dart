import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/tasks_bloc.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/tasks_event.dart';
import 'package:lachies_life_planner/tasks_screen/models/tasks_repository.dart';

class AllBlocProviders extends StatelessWidget {
  final Widget child;

  AllBlocProviders({@required this.child});
  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TasksBloc>(
          create: (context) => TasksBloc(tasksRepository: TasksRepository())..add(LoadTasksEvent()),
        )
      ],
      child: child,
    );
  }
}