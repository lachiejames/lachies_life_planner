import 'package:flutter/material.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment.dart';

class AssignmentForm {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String id;
  DateTime dateCreated;
  String title;
  String subject;
  DateTime dueDate;
  TimeOfDay dueTime;
  String priority;

  AssignmentForm();

  static AssignmentForm fromAssignment(Assignment assignment) {
    DateTime dateTime = assignment.dueDate;
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

  Assignment toAssignment() {
    return Assignment(
      id: id ?? DateTime.now().millisecondsSinceEpoch.toString(),
      dateCreated: dateCreated ?? DateTime.now(),
      title: title,
      subject: subject,
      dueDate: dueDate?.add(Duration(hours: dueTime?.hour, minutes: dueTime?.minute)),
      priority: priority,
      isComplete: false,
    );
  }
}
