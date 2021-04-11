import 'package:flutter_driver/driver_extension.dart';
import 'package:lachies_life_planner/main.dart' as app;
import 'package:lachies_life_planner/tasks_screen/models/tasks_repository.dart';

void main() {
  enableFlutterDriverExtension(handler: (String command) async {
    if (command == 'deleteAllTasks') {
      await TasksRepository().deleteAllTasks();
    } else if (command == 'backToHome') {
      _restartApp();
    } else {
      throw Exception('unknown command: $command');
    }

    return 'ok';
  });

  app.main();
}

void _restartApp() {
  app.main();
}
