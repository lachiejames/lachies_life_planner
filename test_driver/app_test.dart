import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'utils/shared.dart';
import 'utils/tasks_screen.dart';

void main() {
  FlutterDriver driver;

  group('Integration Tests', () {
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    setUp(() async {
      await driver.requestData('deleteAllTasks');
      await driver.requestData('backToHome');
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    group('TasksScreen', () {
      setUp(() async {
        await navigateTo(driver, 'TasksScreen');
      });

      test('adding a task', () async {
        await addTask(driver, 'Test task');
        await expectToFind(driver, find.text('Test task'));
      }, timeout: const Timeout(Duration(seconds: 60)));

      test('updating a task', () async {
        await addTask(driver, 'Test task');
        await updateTask(driver, 'Test task', 'New task name');

        await expectToFind(driver, find.text('New task name'));
      }, timeout: const Timeout(Duration(seconds: 60)));

      test('cancelling during adding a task', () async {
        await driver.tap(find.byType('FloatingActionButton'));
        await enterText(driver, 'Cancel this');
        await driver.tap(find.text('Cancel'));

        await expectNotToFind(driver, find.text('Cancel'));
      }, timeout: const Timeout(Duration(seconds: 60)));

      test('cancelling during updating a task', () async {
        await addTask(driver, 'Test task');

        await driver.tap(find.text('Test task'));
        await enterText(driver, 'Cancel this');
        await driver.tap(find.text('Cancel'));

        await expectToFind(driver, find.text('Test task'));
        await expectNotToFind(driver, find.text('Cancel'));
      }, timeout: const Timeout(Duration(seconds: 60)));

      test('updating a task that requires scrolling to get to', () async {
        await populateTasksList(driver);

        await scrollToTask(driver, 'Task 14');
        await updateTask(driver, 'Task 14', 'New task name');

        await expectToFind(driver, find.text('New task name'));
        await expectNotToFind(driver, find.text('Task 14'));
      }, timeout: const Timeout(Duration(seconds: 200)));

      test('pressing "Delete All Tasks" on overflow menu', () async {
        await populateTasksList(driver);

        for (String taskName in mockTaskNames) {
          await scrollToTask(driver, taskName);
          await expectToFind(driver, find.text(taskName));
        }

        await pressDropDownMenuItem(driver, 'Delete All Tasks');

        for (String taskName in mockTaskNames) {
          await expectNotToFind(driver, find.text(taskName));
        }
      }, timeout: const Timeout(Duration(seconds: 200)));
    });
  });
}
