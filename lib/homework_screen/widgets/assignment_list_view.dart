import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment_database_operations.dart';
import 'package:lachies_life_planner/homework_screen/widgets/assignment_widget.dart';

class AssignmentListView extends StatelessWidget {
  AssignmentListView() : super(key: UniqueKey());

  List<AssignmentWidget> _createAssignmentWidgetsFromDocs(List<QueryDocumentSnapshot> docs) {
    return docs
        .map(
          (DocumentSnapshot doc) => AssignmentWidget(
            assignment: Assignment.fromJson(doc.data()),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: StreamBuilder<QuerySnapshot>(
          stream: getAssignmentsStream(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) => (!snapshot.hasData)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: _createAssignmentWidgetsFromDocs(snapshot.data.docs),
                ),
        ),
      ),
    );
  }
}
