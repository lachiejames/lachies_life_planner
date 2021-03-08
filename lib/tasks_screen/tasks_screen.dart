import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/task_widget.dart';

class TasksScreen extends StatelessWidget {
  final CollectionReference _tasks = FirebaseFirestore.instance.collection('tasks');

  Widget _streamBuilder(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) => (!snapshot.hasData)
      ? Center(child: CircularProgressIndicator())
      : ListView(
          children: snapshot.data.docs
              .map(
                (DocumentSnapshot doc) => TaskWidget(
                  task: Task.fromJson(doc.data()),
                ),
              )
              .toList(),
        );

  Future<void> _addTask() => _tasks.add(Task(
        name: 'howdy',
        dateCreated: Timestamp.now(),
        isComplete: false,
      ).toJson());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTask(),
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
