import 'package:lachies_life_planner/tasks_screen/models/task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final CollectionReference _tasksDatabaseConnection = FirebaseFirestore.instance.collection('tasks');

void addTask(Task task) {
  _tasksDatabaseConnection.doc().set(task.toJson())
    ..then((dynamic value) => print('added $task to FireStore'))
    ..catchError((dynamic e) => print('ERROR: could not add $task to FireStore'));
}

void updateTask(Task task) {
  _tasksDatabaseConnection.doc(task.id).update(task.toJson())
    ..then((dynamic value) => print('updated $task in FireStore'))
    ..catchError((dynamic e) => print('ERROR: could not update $task in FireStore'));
}

void deleteTask(Task task) {
  _tasksDatabaseConnection.doc(task.id).delete()
    ..then((dynamic value) => print('deleted $task from FireStore'))
    ..catchError((dynamic e) => print('ERROR: could not delete $task from FireStore'));
}
