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
  dateCreated: Timestamp(12345, 67890),
  title: 'Assignment 1',
  subject: 'Science',
  dueDate: Timestamp(123456, 0),
  priority: 'Low',
  isComplete: false,
);

final List<Assignment> mockAssignmentList = [
  Assignment(
    id: '1',
    dateCreated: Timestamp(1, 2),
    title: 'Solve P=NP',
    subject: 'Maths',
    dueDate: Timestamp(123456, 0),
    priority: 'High',
    isComplete: false,
  ),
  Assignment(
    id: '2',
    dateCreated: Timestamp(3, 4),
    title: 'Assignment 1',
    subject: 'English',
    dueDate: Timestamp(123456, 0),
    priority: 'Low',
    isComplete: false,
  ),
  Assignment(
    id: '3',
    dateCreated: Timestamp(5, 6),
    title: 'Assignment 1',
    subject: 'Maths',
    dueDate: Timestamp(123456, 0),
    priority: 'Low',
    isComplete: false,
  ),
  Assignment(
    id: '4',
    dateCreated: Timestamp(7, 8),
    title: 'Pop a kickflip',
    subject: 'Economics',
    dueDate: Timestamp(123456, 0),
    priority: 'Medium',
    isComplete: false,
  ),
  Assignment(
    id: '5',
    dateCreated: Timestamp(9, 10),
    title: 'Write a book',
    subject: 'English',
    dueDate: Timestamp(123456, 0),
    priority: 'Low',
    isComplete: false,
  )
];
