import 'package:flutter_driver/flutter_driver.dart';
import 'package:screenshots/capture_screen.dart';
import 'package:screenshots/config.dart';

final Map<dynamic, dynamic> _screenshotsConfig = Config().config;
const bool screenshotsEnabled = true;

Future<void> takeScreenshot(FlutterDriver driver, String name) async {
  if (screenshotsEnabled) {
    await screenshot(driver, _screenshotsConfig, name);
  }
}

Future<void> enterText(FlutterDriver driver, String text) async {
  await driver.waitUntilNoTransientCallbacks();
  await driver.enterText(text);
}

Future<void> expectToFind(FlutterDriver driver, SerializableFinder finder) async {
  await driver.waitFor(finder);
}

Future<void> expectNotToFind(FlutterDriver driver, SerializableFinder finder) async {
  await driver.waitForAbsent(finder);
}

Future<void> navigateTo(FlutterDriver driver, String screenName) async {
  switch (screenName) {
    case 'TasksScreen':
      await driver.tap(find.text('Tasks'));
      break;
    case 'CalendarScreen':
      await driver.tap(find.text('Calendar'));
      break;
    case 'FitnessScreen':
      await driver.tap(find.text('Fitness'));
      break;
    case 'HomeworkScreen':
      await driver.tap(find.text('Homework'));
      break;
    case 'FinanceScreen':
      await driver.tap(find.text('Finance'));
      break;
    case 'GoalsScreen':
      await driver.tap(find.text('Goals'));
      break;
    default:
      throw Exception('Invalid screen name: $screenName');
  }
}

Future<void> pressDropDownMenuItem(FlutterDriver driver, String menuItem) async {
  await driver.tap(find.byType('AppBarOverflowMenu'));
  await driver.tap(find.text(menuItem));
}

// Some tests fail unless we add a random async/await call.  Seems to happen when StreamBuilder is used
Future<void> applyStreamBugWorkAround() => Future.delayed(const Duration(seconds: 1));
