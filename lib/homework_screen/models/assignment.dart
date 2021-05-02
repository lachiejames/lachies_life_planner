import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lachies_life_planner/homework_screen/models/invalid_assignment_exception.dart';

@immutable
class Assignment extends Equatable {
  final String id;
  final Timestamp dateCreated;
  final String title;
  final String subject;
  final Timestamp dueDate;
  final String priority;
  final bool isComplete;

  const Assignment({this.id, this.dateCreated, this.title, this.subject, this.dueDate, this.priority, this.isComplete});

  @override
  List<Object> get props => [id, dateCreated, title, subject, dueDate, priority, isComplete];

  @override
  String toString() {
    return 'Assignment(${toJson()}';
  }

  static bool isValidJsonAssignment(Map<String, dynamic> json) {
    return json.containsKey('id') &&
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
  }

  static Assignment fromJson(Map<String, dynamic> json) {
    try {
      return Assignment(
        id: json['id'],
        dateCreated: json['dateCreated'],
        title: json['title'],
        subject: json['subject'],
        dueDate: json['dueDate'],
        priority: json['priority'],
        isComplete: json['isComplete'],
      );
    } catch (e) {
      throw InvalidAssignmentException(json);
    }
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
