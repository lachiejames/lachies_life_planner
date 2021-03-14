import 'package:lachies_life_planner/shared/firebase_config.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void addTask(Task task) {
  getTaskCollection()
      .doc(task.id)
      .set(task.toJson())
      .catchError((dynamic e) => print('ERROR: could not add $task to FireStore'));
}

void updateTask(Task task) {
  getTaskCollection()
      .doc(task.id)
      .set(task.toJson())
      .catchError((dynamic e) => print('ERROR: could not update $task in FireStore'));
}

void deleteTask(Task task) {
  getTaskCollection()
      .doc(task.id)
      .delete()
      .catchError((dynamic e) => print('ERROR: could not delete $task from FireStore'));
}

Stream<QuerySnapshot> getAllTasks() {
  return getTaskCollection().snapshots().handleError((dynamic e) => print('ERROR: could get tasks from FireStore'));
}

Future<void> deleteAllTasks() async {
  await getTaskCollection().get().then((snapshot) async {
    for (DocumentSnapshot documentSnapshot in snapshot.docs) {
      await documentSnapshot.reference.delete();
    }
  });
}
