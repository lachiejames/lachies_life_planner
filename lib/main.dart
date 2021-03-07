import 'package:flutter/material.dart';
import 'package:lachies_life_planner/home_screen/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // Ensures resources are available for pre-launch setup
  WidgetsFlutterBinding.ensureInitialized();

  // Allows Firebase services to be used
  await Firebase.initializeApp();

 
  runApp(LachiesLifePlannerApp());
}

class LachiesLifePlannerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lachie\'s Life Planner',
      home: HomeScreen(),
    );
  }
}
