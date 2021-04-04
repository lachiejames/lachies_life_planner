import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lachies_life_planner/home_screen/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/task_bloc.dart';
import 'package:lachies_life_planner/tasks_screen/bloc/task_event.dart';
import 'package:lachies_life_planner/tasks_screen/models/task_repository.dart';

void main() async {
  // Ensures resources are available for pre-launch setup
  WidgetsFlutterBinding.ensureInitialized();

  // Allows Firebase services to be used
  await Firebase.initializeApp();

  runApp(LachiesLifePlannerApp());
}

class LachiesLifePlannerApp extends StatelessWidget {
  LachiesLifePlannerApp({Key key}) : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TasksBloc>(
          create: (context) => TasksBloc(tasksRepository: TasksRepository())..add(LoadTasksEvent()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lachie\'s Life Planner',
        home: HomeScreen(),
      ),
    );
  }
}
