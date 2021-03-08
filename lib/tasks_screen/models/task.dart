import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String name;
  final Timestamp dateCreated;
  final bool isComplete;

  Task({this.name, this.dateCreated, this.isComplete});

  Task.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        dateCreated = json['dateCreated'],
        isComplete = json['isComplete'];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'dateCreated': dateCreated,
      'isComplete': isComplete,
    };
  }
}
