import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';
import 'package:lachies_life_planner/tasks_screen/models/task_database_operations.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/task_widget.dart';

class TaskListView extends StatelessWidget {
  TaskListView() : super(key: UniqueKey());

  List<TaskWidget> _createTaskWidgetsFromDocs(List<QueryDocumentSnapshot> docs) {
    return docs
        .map(
          (DocumentSnapshot doc) => TaskWidget(
            task: Task.fromJson(doc.data()),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: getTasksStream(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) => (!snapshot.hasData)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: _createTaskWidgetsFromDocs(snapshot.data.docs),
              ),
      ),
    );
  }
}
