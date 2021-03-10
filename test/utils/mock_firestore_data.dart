import 'package:cloud_firestore/cloud_firestore.dart';
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

final String add1TaskFirestoreDump = '{\n'
    '  "tasks": {\n'
    '    "1234567890": {\n'
    '      "id": "1234567890",\n'
    '      "name": "test task",\n'
    '      "dateCreated": "1970-01-01T14:25:45.000067",\n'
    '      "isComplete": false\n'
    '    }\n'
    '  }\n'
    '}';

final String update1TaskFirestoreDump = '{\n'
    '  "tasks": {\n'
    '    "1234567890": {\n'
    '      "id": "1234567890",\n'
    '      "name": "new task name",\n'
    '      "dateCreated": "1970-01-01T14:25:45.000067",\n'
    '      "isComplete": false\n'
    '    }\n'
    '  }\n'
    '}';

final String add10TasksFirestoreDump = '{\n'
    '  "tasks": {\n'
    '    "0": {\n'
    '      "id": "0",\n'
    '      "name": "test0",\n'
    '      "dateCreated": "1970-01-01T11:00:01.000",\n'
    '      "isComplete": false\n'
    '    },\n'
    '    "1": {\n'
    '      "id": "1",\n'
    '      "name": "test1",\n'
    '      "dateCreated": "1970-01-01T11:00:03.000",\n'
    '      "isComplete": true\n'
    '    },\n'
    '    "2": {\n'
    '      "id": "2",\n'
    '      "name": "test2",\n'
    '      "dateCreated": "1970-01-01T11:00:05.000",\n'
    '      "isComplete": false\n'
    '    },\n'
    '    "3": {\n'
    '      "id": "3",\n'
    '      "name": "test3",\n'
    '      "dateCreated": "1970-01-01T11:00:07.000",\n'
    '      "isComplete": true\n'
    '    },\n'
    '    "4": {\n'
    '      "id": "4",\n'
    '      "name": "test4",\n'
    '      "dateCreated": "1970-01-01T11:00:09.000",\n'
    '      "isComplete": false\n'
    '    },\n'
    '    "5": {\n'
    '      "id": "5",\n'
    '      "name": "test5",\n'
    '      "dateCreated": "1970-01-01T11:00:11.000",\n'
    '      "isComplete": true\n'
    '    },\n'
    '    "6": {\n'
    '      "id": "6",\n'
    '      "name": "test6",\n'
    '      "dateCreated": "1970-01-01T11:00:13.000",\n'
    '      "isComplete": false\n'
    '    },\n'
    '    "7": {\n'
    '      "id": "7",\n'
    '      "name": "test7",\n'
    '      "dateCreated": "1970-01-01T11:00:15.000",\n'
    '      "isComplete": true\n'
    '    },\n'
    '    "8": {\n'
    '      "id": "8",\n'
    '      "name": "test8",\n'
    '      "dateCreated": "1970-01-01T11:00:17.000",\n'
    '      "isComplete": false\n'
    '    },\n'
    '    "9": {\n'
    '      "id": "9",\n'
    '      "name": "test9",\n'
    '      "dateCreated": "1970-01-01T11:00:19.000",\n'
    '      "isComplete": true\n'
    '    }\n'
    '  }\n'
    '}';
