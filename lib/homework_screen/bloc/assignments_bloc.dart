import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:lachies_life_planner/homework_screen/bloc/assignments_event.dart';
import 'package:lachies_life_planner/homework_screen/bloc/assignments_state.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment.dart';
import 'package:lachies_life_planner/homework_screen/models/assignments_repository.dart';
import 'package:lachies_life_planner/shared/exceptions/unknown_bloc_event_exception.dart';


class AssignmentsBloc extends Bloc<AssignmentsEvent, AssignmentsState> {
  final AssignmentsRepository assignmentsRepository;
  StreamSubscription<List<Assignment>> _assignmentsSubscription;

  AssignmentsBloc({@required this.assignmentsRepository}) : super(AssignmentsLoadingState());

  @override
  Stream<AssignmentsState> mapEventToState(AssignmentsEvent event) async* {
    if (event is LoadAssignmentsEvent) {
      yield* _mapLoadAssignmentsToState();
    } else if (event is AssignmentsLoadedEvent) {
      yield* _mapAssignmentsLoadedToState(event);
    } else if (event is AddAssignmentEvent) {
      yield* _mapAddAssignmentToState(event);
    } else if (event is UpdateAssignmentEvent) {
      yield* _mapUpdateAssignmentToState(event);
    } else if (event is DeleteAssignmentEvent) {
      yield* _mapDeleteAssignmentToState(event);
    } else if (event is DeleteAllAssignmentsEvent) {
      yield* _mapDeleteAllAssignmentsToState(event);
    } else {
      throw UnknownBlocEventException(event);
    }
  }

  Stream<AssignmentsState> _mapLoadAssignmentsToState() async* {
    _assignmentsSubscription = assignmentsRepository.getAssignmentsStream().listen(
          (List<Assignment> assignments) => add(AssignmentsLoadedEvent(assignments)),
        );
  }

  Stream<AssignmentsState> _mapAssignmentsLoadedToState(AssignmentsLoadedEvent event) async* {
    yield AssignmentsLoadedState(event.assignments);
  }

  Stream<AssignmentsState> _mapAddAssignmentToState(AddAssignmentEvent event) async* {
    assignmentsRepository.addAssignment(event.assignment);
  }

  Stream<AssignmentsState> _mapUpdateAssignmentToState(UpdateAssignmentEvent event) async* {
    assignmentsRepository.updateAssignment(event.updatedAssignment);
  }

  Stream<AssignmentsState> _mapDeleteAssignmentToState(DeleteAssignmentEvent event) async* {
    assignmentsRepository.deleteAssignment(event.assignment);
  }

  Stream<AssignmentsState> _mapDeleteAllAssignmentsToState(DeleteAllAssignmentsEvent event) async* {
    assignmentsRepository.deleteAllAssignments();
  }

  @override
  Future<void> close() {
    _assignmentsSubscription?.cancel();
    return super.close();
  }
}
