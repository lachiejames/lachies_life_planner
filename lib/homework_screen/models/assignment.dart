import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lachies_life_planner/homework_screen/models/invalid_assignment_exception.dart';

class Assignment {
  final String id;
  final Timestamp dateCreated;
  final String title;
  final String subject;
  final Timestamp dueDate;
  final String priority;
  final bool isComplete;

  Assignment({
    @required this.id,
    @required this.dateCreated,
    @required this.title,
    @required this.subject,
    @required this.dueDate,
    @required this.priority,
    @required this.isComplete,
  });

  @override
  String toString() {
    return 'Assignment(${toJson()}';
  }

  static bool isValidJsonAssignment(Map<String, dynamic> json) =>
      json.containsKey('id') &&
      json.containsKey('dateCreated') &&
      json.containsKey('title') &&
      json.containsKey('subject') &&
      json.containsKey('dueDate') &&
      json.containsKey('priority') &&
      json.containsKey('isComplete') &&
      json.keys.length == 7 &&
      json['id'].runtimeType == String &&
      json['dateCreated'].runtimeType == Timestamp &&
      json['title'].runtimeType == String &&
      json['subject'].runtimeType == String &&
      json['dueDate'].runtimeType == Timestamp &&
      json['priority'].runtimeType == String &&
      json['isComplete'].runtimeType == bool;

  static Assignment fromJson(Map<String, dynamic> json) {
    if (!isValidJsonAssignment(json)) {
      throw InvalidAssignmentException(json);
    }

    return Assignment(
      id: json['id'],
      dateCreated: json['dateCreated'],
      title: json['title'],
      subject: json['subject'],
      dueDate: json['dueDate'],
      priority: json['priority'],
      isComplete: json['isComplete'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'dateCreated': dateCreated,
      'title': title,
      'subject': subject,
      'dueDate': dueDate,
      'priority': priority,
      'isComplete': isComplete,
    };
  }

  Assignment copyWith({
    String title,
    String subject,
    Timestamp dueDate,
    String priority,
    bool isComplete,
  }) {
    return Assignment(
      id: id,
      dateCreated: dateCreated,
      title: title ?? this.title,
      subject: subject ?? this.subject,
      dueDate: dueDate ?? this.dueDate,
      priority: priority ?? this.priority,
      isComplete: isComplete ?? this.isComplete,
    );
  }
}
