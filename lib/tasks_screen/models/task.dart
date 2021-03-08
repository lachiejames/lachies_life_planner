import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String id;
  final String name;
  final Timestamp dateCreated;
  final bool isComplete;

  Task({this.id, this.name, this.dateCreated, this.isComplete});

  Task.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        dateCreated = json['dateCreated'],
        isComplete = json['isComplete'];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'dateCreated': dateCreated,
      'isComplete': isComplete,
    };
  }
}
