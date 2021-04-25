import 'package:flutter_driver/flutter_driver.dart';

import 'shared.dart';

List<String> mockTaskNames = List.generate(15, (int index) => 'Task $index');

Future<void> addTask(FlutterDriver driver, String taskName) async {
  await driver.tap(find.byType('FloatingActionButton'));
  await enterText(driver, taskName);
  await driver.tap(find.text('Add'));
}

Future<void> populateTasksList(FlutterDriver driver) async {
  for (String taskName in mockTaskNames) {
    await addTask(driver, taskName);
  }
  await applyStreamBugWorkAround();
}

Future<void> updateTask(FlutterDriver driver, String oldTaskName, String newTaskName) async {
  await driver.tap(find.text(oldTaskName));
  await enterText(driver, newTaskName);
  await driver.tap(find.text('Update'));
}

Future<void> scrollToTask(FlutterDriver driver, String taskName) async {
  await driver.scrollUntilVisible(find.byType('ListView'), find.text(taskName), dyScroll: -200);
}
