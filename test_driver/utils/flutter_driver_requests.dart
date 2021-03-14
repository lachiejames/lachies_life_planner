import 'package:flutter_driver/flutter_driver.dart';

enum FlutterDriverRequests {
  deleteAllTasks,
}

Future<void> sendFlutterDriverCommand(FlutterDriver driver, FlutterDriverRequests request) =>
    driver.requestData(request.toString());
