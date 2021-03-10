import 'package:flutter_driver/driver_extension.dart';
import 'package:lachies_life_planner/main.dart' as app;
import 'package:lachies_life_planner/shared/global_config.dart';

void main() {
  enableFlutterDriverExtension(handler: (dynamic command) async {
    if (command == 'resetFirestoreData') {
      await resetFirestoreData();
    }
    return 'ok';
  });

  app.main();
}
