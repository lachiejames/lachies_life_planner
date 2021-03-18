import 'package:lachies_life_planner/shared/config/firebase_config.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lachies_life_planner/tasks_screen/models/task_database_exception.dart';

Future<void> addTask(Task task) async {
  await getTaskCollection()
      .doc(task.id)
      .set(task.toJson())
      .catchError((e) => throw TaskDBException('ERROR: could not add $task to FireStore'));
}

Future<Task> getTaskByID(String taskID) async {
  DocumentSnapshot documentSnapshot = await getTaskCollection()
      .doc(taskID)
      .get()
      .catchError((dynamic e) => throw TaskDBException('ERROR: could not get task with id=$taskID from Firestore'));
  return Task.fromJson(documentSnapshot.data());
}

Future<void> updateTask(Task task) async {
  // Throws an error if the task does not exist
  // There seems to be a bug where `.update()` does not throw an error when the task does not exist
  await getTaskByID(task.id);

  await getTaskCollection()
      .doc(task.id)
      .update(task.toJson())
      .catchError((dynamic e) => throw TaskDBException('ERROR: could not update $task in FireStore'));
}

Future<void> deleteTask(Task task) async {
  await getTaskCollection()
      .doc(task.id)
      .delete()
      .catchError((dynamic e) => throw TaskDBException('ERROR: could not delete $task from FireStore'));
}

Stream<QuerySnapshot> getTasksStream() {
  return getTaskCollection()
      .snapshots()
      .handleError((dynamic e) => throw TaskDBException('ERROR: could not retrieve Task snapshots from FireStore'));
}

Future<List<Task>> getAllTasks() async {
  List<Task> tasksInDatabase = [];

  await getTaskCollection().get().then((snapshot) async {
    for (DocumentSnapshot documentSnapshot in snapshot.docs) {
      Map<String, dynamic> taskJson = documentSnapshot.data();
      tasksInDatabase.add(Task.fromJson(taskJson));
    }
  });

  return tasksInDatabase;
}

Future<void> deleteAllTasks() async {
  await getTaskCollection().get().then((snapshot) async {
    for (DocumentSnapshot documentSnapshot in snapshot.docs) {
      await documentSnapshot.reference.delete();
    }
  });
}
