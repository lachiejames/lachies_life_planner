import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App', () {
    FlutterDriver driver;

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
    });

    test('increments the counter', () async {
      await driver.tap(find.byType('FloatingActionButton'));

      await driver.waitFor(find.text('1'));
    });
  });
}
