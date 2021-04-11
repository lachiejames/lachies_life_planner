import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lachies_life_planner/shared/config/firebase_config.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';
import 'package:lachies_life_planner/tasks_screen/models/tasks_repository_exception.dart';

@immutable
class TasksRepository {
  final CollectionReference _taskCollection = getFirestoreInstance().collection('tasks');

  Future<void> addTask(Task task) async {
    _taskCollection
        .doc(task.id)
        .set(task.toJson())
        .catchError((e) => throw TasksRepositoryException('ERROR: could not add $task to FireStore'));
  }

  Future<void> updateTask(Task task) async {
    _taskCollection
        .doc(task.id)
        .update(task.toJson())
        .catchError((dynamic e) => throw TasksRepositoryException('ERROR: could not update $task in FireStore'));
  }

  Future<void> deleteTask(Task task) async {
    _taskCollection
        .doc(task.id)
        .delete()
        .catchError((dynamic e) => throw TasksRepositoryException('ERROR: could not delete $task from FireStore'));
  }

  Future<void> deleteAllTasks() async {
    _taskCollection.get().then((snapshot) async {
      for (DocumentSnapshot documentSnapshot in snapshot.docs) {
        documentSnapshot.reference.delete();
      }
    });
  }

  Stream<List<Task>> getTasksStream() {
    return _taskCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((QueryDocumentSnapshot doc) => Task.fromJson(doc.data())).toList();
    });
  }
}
