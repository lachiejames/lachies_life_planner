import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/task_widget.dart';

class TasksScreen extends StatelessWidget {
  Widget _streamBuilder(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) => (!snapshot.hasData)
      ? CircularProgressIndicator()
      : ListView(
          children: snapshot.data.docs
              .map(
                (DocumentSnapshot doc) => TaskWidget(
                  task: Task.fromJson(doc.data()),
                ),
              )
              .toList(),
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('tasks').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) => _streamBuilder(context, snapshot),
        ),
      ),
    );
  }
}
