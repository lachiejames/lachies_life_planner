import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';

final Task mockTask = Task(
  id: '1234567890',
  dateCreated: Timestamp(12345, 67890),
  name: 'test task',
  isComplete: false,
);

final List<Task> mockTaskList = [
  Task(
    id: '0',
    dateCreated: Timestamp(1, 2),
    name: 'test0',
    isComplete: false,
  ),
  Task(
    id: '1',
    dateCreated: Timestamp(3, 4),
    name: 'test1',
    isComplete: true,
  ),
  Task(
    id: '2',
    dateCreated: Timestamp(5, 6),
    name: 'test2',
    isComplete: false,
  ),
  Task(
    id: '3',
    dateCreated: Timestamp(7, 8),
    name: 'test3',
    isComplete: true,
  ),
  Task(
    id: '4',
    dateCreated: Timestamp(9, 10),
    name: 'test4',
    isComplete: false,
  ),
  Task(
    id: '5',
    dateCreated: Timestamp(11, 12),
    name: 'test5',
    isComplete: true,
  ),
  Task(
    id: '6',
    dateCreated: Timestamp(13, 14),
    name: 'test6',
    isComplete: false,
  ),
  Task(
    id: '7',
    dateCreated: Timestamp(15, 16),
    name: 'test7',
    isComplete: true,
  ),
  Task(
    id: '8',
    dateCreated: Timestamp(17, 18),
    name: 'test8',
    isComplete: false,
  ),
  Task(
    id: '9',
    dateCreated: Timestamp(19, 20),
    name: 'test9',
    isComplete: true,
  ),
];

final Assignment mockAssignment = Assignment(
  id: '1234567890',
  dateCreated: DateTime(2025, 3, 11, 11, 2),
  title: 'Assignment 1',
  subject: 'Science',
  dueDate: DateTime(2025, 3, 14, 11, 2),
  priority: 'Low',
  isComplete: false,
);

final List<Assignment> mockAssignmentList = [
  Assignment(
    id: '1',
    dateCreated: DateTime(2025, 3, 11, 12, 2),
    title: 'Solve P=NP',
    subject: 'Maths',
    dueDate: null,
    priority: 'High',
    isComplete: false,
  ),
  Assignment(
    id: '2',
    dateCreated: DateTime(2025, 3, 12, 4, 20),
    title: 'Assignment 1',
    subject: null,
    dueDate: DateTime(2025, 3, 15, 6, 0),
    priority: 'Low',
    isComplete: false,
  ),
  Assignment(
    id: '3',
    dateCreated: DateTime(2025, 3, 12, 6, 40),
    title: 'Assignment 1',
    subject: null,
    dueDate: null,
    priority: null,
    isComplete: false,
  ),
  Assignment(
    id: '4',
    dateCreated: DateTime(2025, 3, 12, 8, 30),
    title: 'Pop a kickflip',
    subject: 'Economics',
    dueDate: DateTime(2025, 3, 15, 12, 0),
    priority: 'Medium',
    isComplete: false,
  ),
  Assignment(
    id: '5',
    dateCreated: DateTime(2025, 3, 15, 8, 29),
    title: 'Write a book',
    subject: 'English',
    dueDate: DateTime(2025, 4, 1, 12, 0),
    priority: 'Low',
    isComplete: false,
  )
];
