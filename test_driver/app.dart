import 'package:flutter_driver/driver_extension.dart';
import 'package:lachies_life_planner/main.dart' as app;
import 'package:lachies_life_planner/tasks_screen/models/tasks_repository.dart';

Future<void> main() async {
  enableFlutterDriverExtension(handler: (String command) async {
    if (command == 'deleteAllTasks') {
      await TasksRepository().deleteAllTasks();
    } else if (command == 'backToHome') {
      await _restartApp();
    } else {
      throw Exception('unknown command: $command');
    }

    return 'ok';
  });

  await app.main();
}

Future<void> _restartApp() async {
  await app.main();
}
