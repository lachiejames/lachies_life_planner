import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment.dart';

class NewAssignment {
  final GlobalKey<FormState> formKey;
  String id;
  Timestamp dateCreated;
  String title;
  String subject;
  DateTime dueDate;
  TimeOfDay dueTime;
  String priority;

  NewAssignment(this.formKey);

  static NewAssignment fromAssignment(Assignment assignment, GlobalKey<FormState> assignedFormKey) {
    DateTime dateTime = assignment.dueDate?.toDate();
    NewAssignment newAssignment = NewAssignment(assignedFormKey);
    newAssignment.id = assignment.id;
    newAssignment.dateCreated = assignment.dateCreated;
    newAssignment.title = assignment.title;
    newAssignment.subject = assignment.subject;
    newAssignment.dueDate = dateTime == null ? null : DateTime(dateTime?.year, dateTime?.month, dateTime?.day);
    newAssignment.dueTime = dateTime == null ? null : TimeOfDay(hour: dateTime?.hour, minute: dateTime?.minute);
    newAssignment.priority = assignment.priority;
    return newAssignment;
  }

  Timestamp _getDueDate() {
    dueDate?.add(Duration(hours: dueTime?.hour, minutes: dueTime?.minute));

    if (dueDate != null) {
      return Timestamp.fromDate(dueDate);
    } else {
      return null;
    }
  }

  Assignment toAssignment() {
    return Assignment(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      dateCreated: Timestamp.now(),
      title: title,
      subject: subject,
      dueDate: _getDueDate(),
      priority: priority,
      isComplete: false,
    );
  }
}
