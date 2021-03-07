import 'package:flutter/material.dart';
import 'package:lachies_life_planner/home_screen/home_screen.dart';

void main() {
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
