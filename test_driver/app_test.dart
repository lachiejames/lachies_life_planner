import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'utils/shared.dart';
import 'utils/tasks_screen_test_utils.dart';

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
      }, timeout: Timeout(Duration(seconds: 60)));

      test('updating a task', () async {
        await addTask(driver, 'Test task');
        await updateTask(driver, 'Test task', 'New task name');
        await expectToFind(driver, find.text('New task name'));
      }, timeout: Timeout(Duration(seconds: 60)));

      test('cancelling during adding a task', () async {
        await driver.tap(find.byType('FloatingActionButton'));
        await enterText(driver, 'Cancel this');
        await driver.tap(find.text('Cancel'));

        await expectNotToFind(driver, find.text('Cancel'));
      }, timeout: Timeout(Duration(seconds: 60)));

      test('cancelling during updating a task', () async {
        await addTask(driver, 'Test task');

        await driver.tap(find.text('Test task'));
        await enterText(driver, 'Cancel this');
        await driver.tap(find.text('Cancel'));

        await expectToFind(driver, find.text('Test task'));
        await expectNotToFind(driver, find.text('Cancel'));
      }, timeout: Timeout(Duration(seconds: 60)));

      test('updating a task that requires scrolling to get to', () async {
        await populateTasksList(driver);

        await scrollToTask(driver, 'Task $numTasksPopulated');

        await updateTask(driver, 'Task $numTasksPopulated', 'New task name');

        await expectToFind(driver, find.text('New task name'));
        await expectNotToFind(driver, find.text('Task $numTasksPopulated'));
      }, timeout: Timeout(Duration(seconds: 200)));

      test('pressing "Delete All Tasks" on overflow menu', () async {
        print('xxx - 1');

        await populateTasksList(driver);
        print('xxx - 2');
        await Future.delayed(Duration(seconds: 1));

        for (int i = 1; i <= numTasksPopulated; i++) {
          await scrollToTask(driver, 'Task $i');
          await expectToFind(driver, find.text('Task $i'));
        }
        print('xxx - 3');

        await pressDropDownMenuItem(driver, 'Delete All Tasks');
        print('xxx - 4');

        for (int i = 1; i <= numTasksPopulated; i++) {
          await expectNotToFind(driver, find.text('Task $i'));
        }
        print('xxx - 5');
      }, timeout: Timeout(Duration(seconds: 180)));
    });
  });
}
