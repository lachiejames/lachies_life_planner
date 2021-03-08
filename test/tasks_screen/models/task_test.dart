import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/tasks_screen/models/task.dart';

void main() {
  test('works on all screen sizes', () async {
    Task task = Task(
      name: 'my task',
      dateCreated: DateTime.now(),
      schedule: Schedule(
        enabled: true,
        dueDate: DateTime.now(),
      ),
      alarm: Alarm(
        enabled: true,
        dueDate: DateTime.now(),
      ),
    );

    expect(jsonEncode(task.toJson()),
        '{"name":"my task","dateCreated":"2021-03-08 04:33:15.277041","schedule":{"dueDate":"2021-03-08 04:33:15.277041","enabled":true},"alarm":{"dueDate":"2021-03-08 04:33:15.277041","enabled":true}}');
  });
}
