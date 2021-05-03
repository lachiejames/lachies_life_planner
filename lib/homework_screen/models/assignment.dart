import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lachies_life_planner/homework_screen/models/invalid_assignment_exception.dart';

@immutable
class Assignment extends Equatable {
  final String id;
  final DateTime dateCreated;
  final String title;
  final String subject;
  final DateTime dueDate;
  final String priority;
  final bool isComplete;

  const Assignment({this.id, this.dateCreated, this.title, this.subject, this.dueDate, this.priority, this.isComplete});

  @override
  List<Object> get props => [id, dateCreated, title, subject, dueDate, priority, isComplete];

  @override
  String toString() {
    return 'Assignment(${toJson()}';
  }

  static Assignment fromJson(Map<String, dynamic> json) {
    try {
      return Assignment(
        id: json['id'],
        dateCreated: json['dateCreated'] != null ? DateTime.tryParse(json['dateCreated']) : null,
        title: json['title'],
        subject: json['subject'],
        dueDate: json['dueDate'] != null ? DateTime.tryParse(json['dueDate']) : null,
        priority: json['priority'],
        isComplete: json['isComplete'],
      );
    } catch (e) {
      throw InvalidAssignmentException(e, json);
    }
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'dateCreated': dateCreated.toString(),
      'title': title,
      'subject': subject,
      'dueDate': dueDate.toString(),
      'priority': priority,
      'isComplete': isComplete,
    };
  }

  Assignment copyWith({
    String title,
    String subject,
    DateTime dueDate,
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
