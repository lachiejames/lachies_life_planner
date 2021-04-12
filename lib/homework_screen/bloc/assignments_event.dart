import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment.dart';

@immutable
abstract class AssignmentsEvent extends Equatable {
  const AssignmentsEvent();

  @override
  List<Object> get props => [];
}

class LoadAssignmentsEvent extends AssignmentsEvent {}

class AssignmentsLoadedEvent extends AssignmentsEvent {
  final List<Assignment> assignments;

  const AssignmentsLoadedEvent(this.assignments);

  @override
  List<Object> get props => [assignments];
}

class AddAssignmentEvent extends AssignmentsEvent {
  final Assignment assignment;

  const AddAssignmentEvent(this.assignment);

  @override
  List<Object> get props => [assignment];
}

class UpdateAssignmentEvent extends AssignmentsEvent {
  final Assignment updatedAssignment;

  const UpdateAssignmentEvent(this.updatedAssignment);

  @override
  List<Object> get props => [updatedAssignment];
}

class DeleteAssignmentEvent extends AssignmentsEvent {
  final Assignment assignment;

  const DeleteAssignmentEvent(this.assignment);

  @override
  List<Object> get props => [assignment];
}

class DeleteAllAssignmentsEvent extends AssignmentsEvent {}
