import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment.dart';
import 'package:lachies_life_planner/homework_screen/models/tasks_assignment_exception.dart';
import 'package:lachies_life_planner/shared/config/firebase_config.dart';

@immutable
class AssignmentsRepository {
  final CollectionReference _assignmentCollection = getFirestoreInstance().collection('assignments');

  Future<void> addAssignment(Assignment assignment) async {
    _assignmentCollection
        .doc(assignment.id)
        .set(assignment.toJson())
        .catchError((dynamic e) => throw AssignmentsRepositoryException('ERROR: could not add $assignment to FireStore'));
  }

  Future<void> updateAssignment(Assignment assignment) async {
    _assignmentCollection
        .doc(assignment.id)
        .update(assignment.toJson())
        .catchError((dynamic e) => throw AssignmentsRepositoryException('ERROR: could not update $assignment in FireStore'));
  }

  Future<void> deleteAssignment(Assignment assignment) async {
    _assignmentCollection
        .doc(assignment.id)
        .delete()
        .catchError((dynamic e) => throw AssignmentsRepositoryException('ERROR: could not delete $assignment from FireStore'));
  }

  Future<void> deleteAllAssignments() async {
    _assignmentCollection.get().then((QuerySnapshot snapshot) async {
      for (DocumentSnapshot documentSnapshot in snapshot.docs) {
        documentSnapshot.reference.delete();
      }
    });
  }

  Stream<List<Assignment>> getAssignmentsStream() {
    return _assignmentCollection.snapshots().map((QuerySnapshot snapshot) {
      return snapshot.docs.map((QueryDocumentSnapshot doc) => Assignment.fromJson(doc.data())).toList();
    });
  }
}
