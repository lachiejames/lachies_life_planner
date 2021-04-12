import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment.dart';

@immutable
abstract class AssignmentsState extends Equatable {
  const AssignmentsState();

  @override
  List<Object> get props => [];
}

class AssignmentsLoadingState extends AssignmentsState {}

class AssignmentsLoadedState extends AssignmentsState {
  final List<Assignment> assignments;

  const AssignmentsLoadedState([this.assignments = const []]);

  @override
  List<Object> get props => [assignments];
}
