import 'package:lachies_life_planner/shared/global_config.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void addTask(Task task) {
  getFirestoreInstance().collection('tasks').doc(task.id).set(task.toJson())
    ..then((dynamic value) => print('added $task to FireStore'))
    ..catchError((dynamic e) => print('ERROR: could not add $task to FireStore'));
}

void updateTask(Task task) {
  getFirestoreInstance().collection('tasks').doc(task.id).set(task.toJson())
    ..then((dynamic value) => print('updated $task in FireStore'))
    ..catchError((dynamic e) => print('ERROR: could not update $task in FireStore'));
}

void deleteTask(Task task) {
  getFirestoreInstance().collection('tasks').doc(task.id).delete()
    ..then((dynamic value) => print('deleted $task from FireStore'))
    ..catchError((dynamic e) => print('ERROR: could not delete $task from FireStore'));
}

Stream<QuerySnapshot> getAllTasks() {
  return getFirestoreInstance()
      .collection('tasks')
      .snapshots()
      .handleError((dynamic e) => print('ERROR: could get tasks from FireStore'));
}
