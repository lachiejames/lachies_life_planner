import 'package:flutter/material.dart';

/// Relative portion of the device's screen width.  Used to keep widget sizing adaptive
/// Calculated by `screenWidth/100`
double screenWidthUnit;

/// Relative portion of the device's screen height.  Used to keep widget sizing adaptive
/// Calculated by `screenHeight/100`
double screenHeightUnit;

/// IMPORTANT: must be called before building the UI,
/// since nearly all widgets use `screenWidthUnit` and `screenHeightUnit`
void initSizeConfigurations(Size screenSize) {
  screenWidthUnit = screenSize.width / 100;
  screenHeightUnit = screenSize.height / 100;
}
