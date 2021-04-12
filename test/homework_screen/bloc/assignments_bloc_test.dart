import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/homework_screen/bloc/assignments_bloc.dart';
import 'package:lachies_life_planner/homework_screen/bloc/assignments_event.dart';
import 'package:lachies_life_planner/homework_screen/bloc/assignments_state.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment.dart';
import 'package:lachies_life_planner/homework_screen/models/assignments_repository.dart';

import 'package:mockito/mockito.dart';

import '../../utils/mock_firestore_data.dart';

// Cannot make a mock immutable without unnecessary boilerplate
// ignore: must_be_immutable
class MockAssignmentsRepository extends Mock implements AssignmentsRepository {}

class FakeAssignmentsEvent extends AssignmentsEvent {}

void main() {
  AssignmentsRepository mockAssignmentsRepository;

  setUp(() {
    mockAssignmentsRepository = MockAssignmentsRepository();
  });

  group('AssignmentBloc', () {
    blocTest(
      'when getAssignmentsStream() is succeessful, LoadAssignmentsEvent leads to AssignmentsLoadedEvent, which emits [AssignmentsLoadedState]',
      build: () {
        when(mockAssignmentsRepository.getAssignmentsStream()).thenAnswer((_) => Stream<List<Assignment>>.value(mockAssignmentList));
        return AssignmentsBloc(assignmentsRepository: mockAssignmentsRepository);
      },
      act: (dynamic bloc) => bloc.add(LoadAssignmentsEvent()),
      expect: () => [AssignmentsLoadedState(mockAssignmentList)],
    );

    blocTest(
      'when getAssignmentsStream() fails, LoadAssignmentsEvent emits []',
      build: () {
        when(mockAssignmentsRepository.getAssignmentsStream()).thenThrow(Exception('something went wrong'));
        return AssignmentsBloc(assignmentsRepository: mockAssignmentsRepository);
      },
      act: (dynamic bloc) => bloc.add(LoadAssignmentsEvent()),
      expect: () => [],
    );

    blocTest(
      'AssignmentsLoadedEvent emits [AssignmentsLoadedState]',
      build: () {
        when(mockAssignmentsRepository.getAssignmentsStream()).thenAnswer((_) => Stream<List<Assignment>>.value(mockAssignmentList));
        return AssignmentsBloc(assignmentsRepository: mockAssignmentsRepository);
      },
      act: (dynamic bloc) => bloc.add(AssignmentsLoadedEvent(mockAssignmentList)),
      expect: () => [AssignmentsLoadedState(mockAssignmentList)],
    );

    blocTest(
      'AddAssignmentEvent emits no state changes',
      build: () => AssignmentsBloc(assignmentsRepository: mockAssignmentsRepository),
      act: (dynamic bloc) => bloc.add(AddAssignmentEvent(mockAssignment)),
      expect: () => [],
    );

    blocTest(
      'UpdateAssignmentEvent emits no state changes',
      build: () => AssignmentsBloc(assignmentsRepository: mockAssignmentsRepository),
      act: (dynamic bloc) => bloc.add(UpdateAssignmentEvent(mockAssignment)),
      expect: () => [],
    );

    blocTest(
      'DeleteAssignmentEvent emits no state changes',
      build: () => AssignmentsBloc(assignmentsRepository: mockAssignmentsRepository),
      act: (dynamic bloc) => bloc.add(DeleteAssignmentEvent(mockAssignment)),
      expect: () => [],
    );

    blocTest(
      'DeleteAllAssignmentsEvent emits no state changes',
      build: () => AssignmentsBloc(assignmentsRepository: mockAssignmentsRepository),
      act: (dynamic bloc) => bloc.add(DeleteAllAssignmentsEvent()),
      expect: () => [],
    );

    test('throws exception when an unknown AssignmentEvent is passed', () async {
      await runZonedGuarded(() async {
        AssignmentsBloc(assignmentsRepository: mockAssignmentsRepository).add(FakeAssignmentsEvent());
      }, (Object exception, StackTrace stackTrace) {
        // We actually throw UnknownBlocEventException, but that cannot be tested
        expect(exception, isA<BlocUnhandledErrorException>());
      });
    });
  });
}
