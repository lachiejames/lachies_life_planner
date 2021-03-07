import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/shared/size_config.dart';

// Android devices
final Size Google_Pixel_4 = Size(412, 869);
final Size Google_Pixel_3a = Size(412, 846);
final Size Google_Pixel_3_XL = Size(412, 847);
final Size Google_Pixel_3 = Size(412, 824);
final Size Google_Pixel = Size(412, 732);
final Size Samsung_Galaxy_Note_5 = Size(480, 853);
final Size Samsung_Galaxy_S9 = Size(360, 740);
final Size Samsung_Galaxy_S7 = Size(360, 640);
final Size Nexus_7 = Size(600, 912);
final Size Pixel_C = Size(900, 1280);
final Size Samsung_Galaxy_Tab_10 = Size(800, 1280);
final Size Chromebook_Pixel = Size(1280, 850);

// IOS devices
final Size iPhone_XR = Size(414, 896);
final Size iPhone_X = Size(375, 812);
final Size iPhone_8_Plus = Size(414, 736);
final Size iPhone_8 = Size(375, 667);
final Size iPhone_5 = Size(320, 568);
final Size iPad_Pro = Size(1024, 1366);
final Size iPad_Mini = Size(768, 1024);

final List<Size> allDeviceSizes = <Size>[
  Google_Pixel_4,
  Google_Pixel_3a,
  Google_Pixel_3_XL,
  Google_Pixel_3,
  Google_Pixel,
  Samsung_Galaxy_Note_5,
  Samsung_Galaxy_S9,
  Samsung_Galaxy_S7,
  Nexus_7,
  Pixel_C,
  Samsung_Galaxy_Tab_10,
  Chromebook_Pixel,
  iPhone_XR,
  iPhone_X,
  iPhone_8_Plus,
  iPhone_8,
  iPhone_5,
  iPad_Pro,
  iPad_Mini,
];

void setupWidgetTestDevice(WidgetTester tester, Size size) {
  tester.binding.window.clearPhysicalSizeTestValue();
  tester.binding.window.physicalSizeTestValue = size;
  tester.binding.window.devicePixelRatioTestValue = 1.0;
  initSizeConfigurations(size);
}
