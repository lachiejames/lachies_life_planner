import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lachies_life_planner/home_screen/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // Ensures resources are available for pre-launch setup
  WidgetsFlutterBinding.ensureInitialized();

  // Allows Firebase services to be used
  await Firebase.initializeApp();

  CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
  await tasks
      .add(<String, dynamic>{
        'name': 'my task name',
        'dateCreated': DateTime.now(),
        'schedule': <String, dynamic>{
          'enabled': false,
          'dueData': DateTime.now(),
        },
        'alarm': <String, dynamic>{
          'enabled': false,
          'dueDate': DateTime.now(),
        }
      })
      .then((dynamic value) => print('Task Added'))
      .catchError((dynamic error) => print('Failed to add task: $error'));

  print(await tasks.doc('Tasks').get());

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
