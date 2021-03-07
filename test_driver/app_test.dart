import 'package:flutter_driver/flutter_driver.dart';
import 'package:screenshots/capture_screen.dart';
import 'package:screenshots/config.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver driver;
  final Map<dynamic, dynamic> config = Config().config;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
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

    await screenshot(driver, config, 'home_screen');
  }, timeout: Timeout(Duration(seconds: 60)));

  test('can navigate to each base screen', () async {
    await driver.tap(find.text('Tasks'));
    await screenshot(driver, config, 'tasks_screen');
    await driver.tap(find.byType('BackButton'));

    await driver.tap(find.text('Calendar'));
    await screenshot(driver, config, 'calendar_screen');
    await driver.tap(find.byType('BackButton'));

    await driver.tap(find.text('Fitness'));
    await screenshot(driver, config, 'fitness_screen');
    await driver.tap(find.byType('BackButton'));

    await driver.tap(find.text('Homework'));
    await screenshot(driver, config, 'homework_screen');
    await driver.tap(find.byType('BackButton'));

    await driver.tap(find.text('Finance'));
    await screenshot(driver, config, 'finance_screen');
    await driver.tap(find.byType('BackButton'));

    await driver.tap(find.text('Goals'));
    await screenshot(driver, config, 'goals_screen');
    await driver.tap(find.byType('BackButton'));
  }, timeout: Timeout(Duration(seconds: 120)));
}
