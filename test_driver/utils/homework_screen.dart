import 'package:flutter_driver/flutter_driver.dart';

import 'shared.dart';

List<String> mockAssignmentNames = List.generate(15, (int index) => 'Assignment $index');

Future<void> addAssignment(FlutterDriver driver, String assignmentName) async {
  await driver.tap(find.byType('FloatingActionButton'));
  await enterText(driver, assignmentName);
  await driver.tap(find.text('Add'));
}

Future<void> populateAssignmentsList(FlutterDriver driver) async {
  for (String assignmentName in mockAssignmentNames) {
    await addAssignment(driver, assignmentName);
  }
  await applyStreamBugWorkAround();
}

Future<void> updateAssignment(FlutterDriver driver, String oldAssignmentName, String assignmentFormName) async {
  await driver.tap(find.text(oldAssignmentName));
  await enterText(driver, assignmentFormName);
  await driver.tap(find.text('Update'));
}

Future<void> scrollToAssignment(FlutterDriver driver, String assignmentName) async {
  await driver.scrollUntilVisible(find.byType('ListView'), find.text(assignmentName), dyScroll: -200);
}
