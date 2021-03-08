import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lachies_life_planner/tasks_screen/models/task-database-operations.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/task_widget.dart';

class TasksScreen extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addTask(
          Task(
            id: DateTime.now().microsecondsSinceEpoch.toString(),
            name: 'howdy',
            dateCreated: Timestamp.now(),
            isComplete: false,
          ),
        ),
        child: Icon(Icons.add),
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: getAllTasks(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) => _streamBuilder(context, snapshot),
        ),
      ),
    );
  }
}
