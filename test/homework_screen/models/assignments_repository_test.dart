import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment.dart';
import 'package:lachies_life_planner/homework_screen/models/assignments_repository.dart';
import 'package:lachies_life_planner/homework_screen/models/invalid_assignment_exception.dart';
import 'package:lachies_life_planner/shared/config/firebase_config.dart';

import '../../utils/mock_firestore_data.dart';
import '../../utils/repository_operations.dart';

void main() {
  AssignmentsRepository assignmentsRepository;

  group('AssignmentsRepository', () {
    setUp(() {
      setFirestoreInstance(MockFirestoreInstance());
      assignmentsRepository = AssignmentsRepository();
    });

    test('addAssignment() adds assignment to Firestore', () async {
      await assignmentsRepository.addAssignment(mockAssignment);
      Assignment assignmentInRepository = await getAssignmentByID(mockAssignment.id);
      expect(assignmentInRepository.toJson(), mockAssignment.toJson());
    });

    test('getAssignmentByID() returns a assignment if it exists', () async {
      await assignmentsRepository.addAssignment(mockAssignment);
      Assignment assignmentInRepository = await getAssignmentByID(mockAssignment.id);
      expect(assignmentInRepository.toJson(), mockAssignment.toJson());
    });

    test('getAssignmentByID() throws an error when the assignment does not exist', () async {
      await expectLater(getAssignmentByID(mockAssignment.id), throwsA(isA<InvalidAssignmentException>()));
    });

    test('updateAssignment() updates assignment in Firestore', () async {
      await assignmentsRepository.addAssignment(mockAssignment);
      Assignment updatedAssignment = mockAssignment.copyWith(title: 'new assignment title');
      await assignmentsRepository.updateAssignment(updatedAssignment);

      Assignment assignmentInRepository = await getAssignmentByID(mockAssignment.id);
      expect(assignmentInRepository.toJson(), {
        'id': '1234567890',
        'dateCreated': Timestamp(12345, 67890),
        'title': 'new assignment title',
        'subject': 'Science',
        'dueDate': Timestamp(123456, 0),
        'priority': 'Low',
        'isComplete': false,
      });
    });

    test('updateAssignment() throws an error when assignment does not exist', () async {
      await expectLater(
        assignmentsRepository.updateAssignment(mockAssignment.copyWith(title: 'new assignment name')),
        throwsA(isA<NoSuchMethodError>()),
      );
      // Failing due to a bug in cloud firestore mocks - https://github.com/atn832/cloud_firestore_mocks/issues/152
    }, skip: true);

    test('deleteAssignment() removes assignment from Firestore', () async {
      await assignmentsRepository.addAssignment(mockAssignment);
      await assignmentsRepository.deleteAssignment(mockAssignment);

      await expectLater(getAssignmentByID(mockAssignment.id), throwsA(isA<InvalidAssignmentException>()));
    });

    test('getAllAssignments() returns all assignments from Firestore', () async {
      for (Assignment assignment in mockAssignmentList) {
        await assignmentsRepository.addAssignment(assignment);
      }

      List<Assignment> assignments = await getAllAssignments();
      expect(assignments.length, 5);

      for (int i = 0; i < 5; i++) {
        expect(assignments[i].toJson(), mockAssignmentList[i].toJson());
      }
    });

    test('deleteAllAssignments() removes all assignments from Firestore', () async {
      for (Assignment assignment in mockAssignmentList) {
        await assignmentsRepository.addAssignment(assignment);
      }

      await assignmentsRepository.deleteAllAssignments();

      for (Assignment assignment in mockAssignmentList) {
        await expectLater(getAssignmentByID(assignment.id), throwsA(isA<InvalidAssignmentException>()));
      }
    });

    test('getAssignmentsStream() returns a stream that emits all assignments in the repository', () async {
      for (Assignment assignment in mockAssignmentList) {
        await assignmentsRepository.addAssignment(assignment);
      }

      expect(assignmentsRepository.getAssignmentsStream(), emits(mockAssignmentList));
    });
  });
}
