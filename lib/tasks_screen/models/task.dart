import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lachies_life_planner/tasks_screen/models/invalid_task_exception.dart';
import 'package:equatable/equatable.dart';

@immutable
class Task extends Equatable {
  final String id;
  final Timestamp dateCreated;
  final String name;
  final bool isComplete;

  Task({@required this.id, @required this.dateCreated, @required this.name, @required this.isComplete});

  @override
  List<Object> get props => [name];

  @override
  String toString() {
    return 'Task(${toJson()}';
  }

  static bool isValidJsonTask(Map<String, dynamic> json) =>
      json.containsKey('id') &&
      json.containsKey('name') &&
      json.containsKey('dateCreated') &&
      json.containsKey('isComplete') &&
      json.keys.length == 4 &&
      json['id'].runtimeType == String &&
      json['name'].runtimeType == String &&
      json['dateCreated'].runtimeType == Timestamp &&
      json['isComplete'].runtimeType == bool;

  static Task fromJson(Map<String, dynamic> json) {
    if (!isValidJsonTask(json)) {
      throw InvalidTaskException(json);
    }

    return Task(
      id: json['id'],
      name: json['name'],
      dateCreated: json['dateCreated'],
      isComplete: json['isComplete'],
    );
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
