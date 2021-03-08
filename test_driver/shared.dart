import 'package:flutter_driver/flutter_driver.dart';
import 'package:screenshots/capture_screen.dart';
import 'package:screenshots/config.dart';

final Map<dynamic, dynamic> _screenshotsConfig = Config().config;
const bool screenshotsEnabled = false;

Future<void> takeScreenshot(FlutterDriver driver, String name) async {
  if (screenshotsEnabled) {
    await screenshot(driver, _screenshotsConfig, name);
  }
}
