import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment.dart';
import 'package:lachies_life_planner/homework_screen/models/invalid_assignment_exception.dart';

import '../../utils/mock_firestore_data.dart';

void main() {
  group('Assignment', () {
    test('toString() returns correct string', () async {
      expect(mockAssignment.toString(),
          'Assignment({id: 1234567890, dateCreated: Timestamp(seconds=12345, nanoseconds=67890), title: Assignment 1, subject: Science, dueDate: Timestamp(seconds=123456, nanoseconds=0), priority: Low, isComplete: false}');
    });

    test('toJSON() returns correct JSON object', () async {
      expect(mockAssignment.toJson(), {
        'id': '1234567890',
        'dateCreated': Timestamp(12345, 67890),
        'title': 'Assignment 1',
        'subject': 'Science',
        'dueDate': Timestamp(123456, 0),
        'priority': 'Low',
        'isComplete': false,
      });
    });

    group('fromJson()', () {
      test('when assignment is correctly formatted with correct types, returns Assignment object', () async {
        Map<String, dynamic> jsonAssignment = {
          'id': '1234567890',
          'dateCreated': Timestamp(12345, 67890),
          'title': 'Assignment 1',
          'subject': 'Science',
          'dueDate': Timestamp(123456, 0),
          'priority': 'Low',
          'isComplete': false
        };
        Assignment parsedAssignment = Assignment.fromJson(jsonAssignment);

        expect(parsedAssignment.toString(), mockAssignment.toString());
      });

      test('should throw InvalidAssignmentException when incorrectly formatted assignment is passed', () {
        Map<String, dynamic> invalidJsonAssignment = {
          'id': '1234567890',
          'dateCreated': Timestamp(12345, 67890),
          'name': 'Assignment 1',
          'subject': 'Science',
          'dueDate': Timestamp(123456, 0),
          'priority': 'Low',
          'isComplete': false
        };

        // For throwsA() to work, we must wrap the error-throwing function inside a zero-argument function
        expect(() => Assignment.fromJson(invalidJsonAssignment), throwsA(isA<InvalidAssignmentException>()));
      });

      test('should throw InvalidAssignmentException when incorrect types are passed', () async {
        Map<String, dynamic> invalidJsonAssignment = {
          'id': '1234567890',
          'dateCreated': Timestamp(12345, 67890),
          'title': 'Assignment 1',
          'subject': 'Science',
          'dueDate': 3,
          'priority': 'Low',
          'isComplete': false
        };

        expect(() => Assignment.fromJson(invalidJsonAssignment), throwsA(isA<InvalidAssignmentException>()));
      });
    });

    test('copyWith() returns new Assignment with values modified', () async {
      Assignment assignmentCopy = mockAssignment.copyWith(
        title: 'New assignment name',
        subject: 'New subject name',
        dueDate: Timestamp(123456, 0),
        priority: 'High',
        isComplete: true,
      );

      expect(assignmentCopy.toJson(), {
        'id': '1234567890',
        'dateCreated': Timestamp(12345, 67890),
        'title': 'New assignment name',
        'subject': 'New subject name',
        'dueDate': Timestamp(123456, 0),
        'priority': 'High',
        'isComplete': true
      });
    });

    test('copyWith() retains all values when no args are passed', () async {
      Assignment assignmentCopy = mockAssignment.copyWith();

      expect(assignmentCopy.toJson(), {
        'id': '1234567890',
        'dateCreated': Timestamp(12345, 67890),
        'title': 'Assignment 1',
        'subject': 'Science',
        'dueDate': Timestamp(123456, 0),
        'priority': 'Low',
        'isComplete': false
      });
    });
  });
}
