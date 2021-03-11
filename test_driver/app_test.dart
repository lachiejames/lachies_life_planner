import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'shared.dart';

void main() {
  FlutterDriver driver;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  setUp(() async {
    await driver.requestData('resetFirestoreData');
  });

  tearDownAll(() async {
    if (driver != null) {
      await driver.close();
    }
  });

  test('home screen buttons appear', () async {
    await driver.waitFor(find.text('Tasks'));
    await driver.waitFor(find.text('Calendar'));
    await driver.waitFor(find.text('Fitness'));
    await driver.waitFor(find.text('Homework'));
    await driver.waitFor(find.text('Finance'));
    await driver.waitFor(find.text('Goals'));

    await takeScreenshot(driver, 'home/home_screen');
  }, timeout: Timeout(Duration(seconds: 60)));

  test('adding a task', () async {
    await driver.tap(find.text('Tasks'));
    await takeScreenshot(driver, 'tasks/tasks_screen');

    await driver.tap(find.byType('FloatingActionButton'));
    await takeScreenshot(driver, 'tasks/add_task_button_pressed');

    // Must tap before entering text https://github.com/flutter/flutter/issues/53410
    await driver.tap(find.byType('TextField'));
    await driver.enterText('Test task');
    await takeScreenshot(driver, 'tasks/task_text_entered');

    await driver.tap(find.text('Add'));
    await takeScreenshot(driver, 'tasks/task_added');

    await driver.waitFor(find.text('Test task'));
  }, timeout: Timeout(Duration(seconds: 60)));

  test('editing a task', () async {
    await driver.tap(find.text('Tasks'));

    await driver.tap(find.byType('FloatingActionButton'));

    await driver.enterText('Test task');

    await driver.tap(find.text('Add'));

    await driver.tap(find.text('Test task'));

    await driver.tap(find.byType('TextField'));
    await driver.enterText('New task name');
    await takeScreenshot(driver, 'tasks/editing_start');

    await driver.tap(find.text('Update'));

    await driver.waitFor(find.text('New task name'));
    await takeScreenshot(driver, 'tasks/editing_complete');
  }, timeout: Timeout(Duration(seconds: 60)));
}
