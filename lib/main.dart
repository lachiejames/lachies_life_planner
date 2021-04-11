import 'package:flutter/material.dart';
import 'package:lachies_life_planner/home_screen/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lachies_life_planner/shared/widgets/all_bloc_providers.dart';

void main() async {
  // Ensures resources are available for pre-launch setup
  WidgetsFlutterBinding.ensureInitialized();

  // Allows Firebase services to be used
  await Firebase.initializeApp();

  runApp(LachiesLifePlannerApp());
}

@immutable
class LachiesLifePlannerApp extends StatelessWidget {
  LachiesLifePlannerApp({Key key}) : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    return AllBlocProviders(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lachie\'s Life Planner',
        home: HomeScreen(),
      ),
    );
  }
}
