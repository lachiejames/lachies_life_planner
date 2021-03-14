import 'package:flutter_driver/driver_extension.dart';
import 'package:lachies_life_planner/main.dart' as app;
import 'package:lachies_life_planner/tasks_screen/models/task_database_operations.dart';

void main() {
  enableFlutterDriverExtension(handler: (dynamic command) async {
    if (command == 'deleteAllTasks') {
      await deleteAllTasks();
    }
    return 'ok';
  });

  app.main();
}
