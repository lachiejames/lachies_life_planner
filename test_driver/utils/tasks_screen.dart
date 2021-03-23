import 'package:flutter_driver/flutter_driver.dart';

import 'shared.dart';

const numTasksPopulated = 15;

Future<void> addTask(FlutterDriver driver, String taskName) async {
  await driver.tap(find.byType('FloatingActionButton'));
  await enterText(driver, taskName);
  await driver.tap(find.text('Add'));
}

Future<void> populateTasksList(FlutterDriver driver) async {
  for (int i = 1; i <= numTasksPopulated; i++) {
    await addTask(driver, 'Task $i');
  }
  await applyStreamBugWorkAround();
}

Future<void> updateTask(FlutterDriver driver, String oldTaskName, String newTaskName) async {
  await driver.tap(find.text(oldTaskName));
  await enterText(driver, newTaskName);
  await driver.tap(find.text('Update'));
}

Future<void> pressDropDownMenuItem(FlutterDriver driver, String menuItem) async {
  await driver.tap(find.byType('AppBarOverflowMenu'));
  await driver.tap(find.text(menuItem));
}

Future<void> scrollToTask(FlutterDriver driver, String taskName) async {
  await driver.scrollUntilVisible(find.byType('ListView'), find.text(taskName), dyScroll: -200);
}
