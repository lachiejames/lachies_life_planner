import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lachies_life_planner/shared/size_config.dart';
import 'package:lachies_life_planner/tasks_screen/models/task-database-operations.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/edit_task_widget.dart';
import 'package:lachies_life_planner/tasks_screen/widgets/task_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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
        onPressed: () => showMaterialModalBottomSheet(
          context: context,
          builder: (BuildContext context) => EditTaskWidget(),
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
