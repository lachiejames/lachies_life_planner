import 'package:lachies_life_planner/homework_screen/models/assignment.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment_database_exception.dart';
import 'package:lachies_life_planner/shared/config/firebase_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addAssignment(Assignment assignment) async {
  await getAssignmentCollection()
      .doc(assignment.id)
      .set(assignment.toJson())
      .catchError((e) => throw AssignmentDBException('ERROR: could not add $assignment to FireStore'));
}

Future<Assignment> getAssignmentByID(String assignmentID) async {
  DocumentSnapshot documentSnapshot = await getAssignmentCollection()
      .doc(assignmentID)
      .get()
      .catchError((dynamic e) => throw AssignmentDBException('ERROR: could not get assignment with id=$assignmentID from Firestore'));
  return Assignment.fromJson(documentSnapshot.data());
}

Future<void> updateAssignment(Assignment assignment) async {
  // Throws an error if the assignment does not exist
  // There seems to be a bug where `.update()` does not throw an error when the assignment does not exist
  await getAssignmentByID(assignment.id);

  await getAssignmentCollection()
      .doc(assignment.id)
      .update(assignment.toJson())
      .catchError((dynamic e) => throw AssignmentDBException('ERROR: could not update $assignment in FireStore'));
}

Future<void> deleteAssignment(Assignment assignment) async {
  await getAssignmentCollection()
      .doc(assignment.id)
      .delete()
      .catchError((dynamic e) => throw AssignmentDBException('ERROR: could not delete $assignment from FireStore'));
}

Stream<QuerySnapshot> getAssignmentsStream() {
  return getAssignmentCollection()
      .snapshots()
      .handleError((dynamic e) => throw AssignmentDBException('ERROR: could not retrieve Assignment snapshots from FireStore'));
}

Future<List<Assignment>> getAllAssignments() async {
  List<Assignment> assignmentsInDatabase = [];

  await getAssignmentCollection().get().then((snapshot) async {
    for (DocumentSnapshot documentSnapshot in snapshot.docs) {
      Map<String, dynamic> assignmentJson = documentSnapshot.data();
      assignmentsInDatabase.add(Assignment.fromJson(assignmentJson));
    }
  });

  return assignmentsInDatabase;
}

Future<void> deleteAllAssignments() async {
  await getAssignmentCollection().get().then((snapshot) async {
    for (DocumentSnapshot documentSnapshot in snapshot.docs) {
      await documentSnapshot.reference.delete();
    }
  });
}
