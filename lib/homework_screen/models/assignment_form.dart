import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment.dart';

class AssignmentForm {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String id;
  Timestamp dateCreated;
  String title;
  String subject;
  DateTime dueDate;
  TimeOfDay dueTime;
  String priority;

  AssignmentForm();

  static AssignmentForm fromAssignment(Assignment assignment) {
    DateTime dateTime = assignment.dueDate?.toDate();
    AssignmentForm assignmentForm = AssignmentForm();
    assignmentForm.id = assignment.id;
    assignmentForm.dateCreated = assignment.dateCreated;
    assignmentForm.title = assignment.title;
    assignmentForm.subject = assignment.subject;
    assignmentForm.dueDate = dateTime == null ? null : DateTime(dateTime?.year, dateTime?.month, dateTime?.day);
    assignmentForm.dueTime = dateTime == null ? null : TimeOfDay(hour: dateTime?.hour, minute: dateTime?.minute);
    assignmentForm.priority = assignment.priority;
    return assignmentForm;
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
