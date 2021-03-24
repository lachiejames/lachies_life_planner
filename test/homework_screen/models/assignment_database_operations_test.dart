import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment_database_operations.dart';
import 'package:lachies_life_planner/shared/config/firebase_config.dart';

import '../../utils/mock_firestore_data.dart';

void main() {
  group('Assignment DB Operations', () {
    setUp(() {
      setFirestoreInstance(MockFirestoreInstance());
    });

    test('addAssignment() adds assignment to Firestore', () async {
      await addAssignment(mockAssignment);
      expect((await getAssignmentByID(mockAssignment.id)).toJson(), mockAssignment.toJson());
    });

    test('addAssignment() can be used multiple times', () async {
      for (Assignment assignment in mockAssignmentList) {
        await addAssignment(assignment);
        expect((await getAssignmentByID(assignment.id)).toJson(), assignment.toJson());
      }
    });

    test('getAssignmentByID() returns a assignment it exists', () async {
      await addAssignment(mockAssignment);
      expect((await getAssignmentByID(mockAssignment.id)).toJson(), mockAssignment.toJson());
    });

    test('getAssignmentByID() throws an error when the assignment does not exist', () async {
      expect(() async => await getAssignmentByID(mockAssignment.id), throwsA(isA<NoSuchMethodError>()));
    });

    test('updateAssignment() updates assignment in Firestore', () async {
      await addAssignment(mockAssignment);
      await updateAssignment(mockAssignment.copyWith(title: 'New assignment name'));

      expect((await getAssignmentByID(mockAssignment.id)).toJson(), {
        'id': '1234567890',
        'dateCreated': Timestamp(12345, 67890),
        'title': 'New assignment name',
        'subject': 'Science',
        'dueDate': Timestamp(123456, 0),
        'priority': 'Low',
        'isComplete': false,
      });
    });

    test('updateAssignment() throws an error when assignment does not exist', () async {
      expect(() async => await updateAssignment(mockAssignment.copyWith(title: 'new assignment name')), throwsA(isA<NoSuchMethodError>()));
    });

    test('deleteAssignment() removes assignment from Firestore', () async {
      await addAssignment(mockAssignment);
      await deleteAssignment(mockAssignment);

      expect(() async => await getAssignmentByID(mockAssignment.id), throwsA(isA<NoSuchMethodError>()));
    });

    test('getAllAssignments() returns all assignments from Firestore', () async {
      for (Assignment assignment in mockAssignmentList) {
        await addAssignment(assignment);
      }

      List<Assignment> assignments = await getAllAssignments();
      expect(assignments.length, 5);

      for (int i = 0; i < 5; i++) {
        expect(assignments[i].toJson(), mockAssignmentList[i].toJson());
      }
    });

    test('deleteAllAssignments() removes all assignments from Firestore', () async {
      for (Assignment assignment in mockAssignmentList) {
        await addAssignment(assignment);
      }

      await deleteAllAssignments();

      for (Assignment assignment in mockAssignmentList) {
        expect(() async => await getAssignmentByID(assignment.id), throwsA(isA<NoSuchMethodError>()));
      }
    });
  });
}
