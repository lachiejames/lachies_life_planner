import 'package:flutter/material.dart';

class NewAssignment {
  final GlobalKey<FormState> formKey;
  String title;
  String subject;
  DateTime dueDate;
  TimeOfDay dueTime;
  String priority;

  NewAssignment(this.formKey);
}
