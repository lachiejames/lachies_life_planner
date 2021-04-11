import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lachies_life_planner/shared/config/firebase_config.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';

Future<Task> getTaskByID(String taskID) async {
  DocumentSnapshot documentSnapshot = await getFirestoreInstance().collection('tasks').doc(taskID).get();

  return Task.fromJson(documentSnapshot.data());
}

Future<List<Task>> getAllTasks() async {
  List<Task> tasksInDatabase = [];

  await getFirestoreInstance().collection('tasks').get().then((QuerySnapshot snapshot) {
    for (DocumentSnapshot documentSnapshot in snapshot.docs) {
      Map<String, dynamic> taskJson = documentSnapshot.data();
      tasksInDatabase.add(Task.fromJson(taskJson));
    }
  });

  return tasksInDatabase;
}
