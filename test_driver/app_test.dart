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

    test('starts at 0', () async {
      await driver.waitFor(find.text('0'));
      await screenshot(driver, config, 'test1');
    }, timeout: Timeout(Duration(seconds: 60)));

    test('increments the counter', () async {
      await driver.tap(find.byType('FloatingActionButton'));

      await driver.waitFor(find.text('1'));
      await screenshot(driver, config, 'test2');
    }, timeout: Timeout(Duration(seconds: 60)));
  });
}
