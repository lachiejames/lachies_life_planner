import 'package:flutter_driver/flutter_driver.dart';
import 'package:screenshots/capture_screen.dart';
import 'package:screenshots/config.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App', () {
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
  });
}
