import 'package:flutter_driver/driver_extension.dart';
import 'package:lachies_life_planner/main.dart' as app;
import 'package:lachies_life_planner/tasks_screen/models/task_database_operations.dart';

// Easier than writing 'if' statements
Map<String, dynamic> _stringToFunctionMap = {
  'deleteAllTasks': deleteAllTasks(),
};

void main() {
  enableFlutterDriverExtension(handler: (String command) async {
    await _stringToFunctionMap[command];
    return 'ok';
  });

  app.main();
}
