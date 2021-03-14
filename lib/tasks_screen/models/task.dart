import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lachies_life_planner/tasks_screen/models/invalid_task_exception.dart';

class Task {
  final String id;
  final String name;
  final Timestamp dateCreated;
  final bool isComplete;

  Task({this.id, this.name, this.dateCreated, this.isComplete});

  @override
  String toString() {
    return 'Task(${toJson()}';
  }

  static Task fromJson(Map<String, dynamic> json) {
    try {
      return Task(
        id: json['id'],
        name: json['name'],
        dateCreated: json['dateCreated'],
        isComplete: json['isComplete'],
      );
    } catch (e) {
      throw InvalidTaskException(json);
    }
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'dateCreated': dateCreated,
      'isComplete': isComplete,
    };
  }

  Task copyWith({
    String name,
    bool isComplete,
  }) {
    return Task(
      id: id,
      dateCreated: dateCreated,
      name: name ?? this.name,
      isComplete: isComplete ?? this.isComplete,
    );
  }
}
