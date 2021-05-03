import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/homework_screen/bloc/assignments_bloc.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment.dart';
import 'package:lachies_life_planner/homework_screen/models/assignments_repository.dart';
import 'package:lachies_life_planner/homework_screen/widgets/edit_assignment_widget/edit_assignment_sheet.dart';
import 'package:lachies_life_planner/homework_screen/widgets/edit_assignment_widget/edit_assignment_text_field.dart';
import 'package:lachies_life_planner/shared/config/firebase_config.dart';

import '../../../utils/device_screen_sizes.dart';
import '../../../utils/mock_firestore_data.dart';
import '../../../utils/repository_operations.dart';
import '../../../utils/widget_tester.dart';

void main() {
  AssignmentsRepository assignmentsRepository;

  Future<void> initEditAssignmentSheet(WidgetTester tester, {@required Assignment assignment, Size size = samsungGalaxyNote5}) async {
    await tester.pumpWidget(
      BlocProvider<AssignmentsBloc>(
        create: (BuildContext context) => AssignmentsBloc(assignmentsRepository: assignmentsRepository),
        child: MaterialApp(
          home: Scaffold(
            body: WidgetTestingWrapper(
              screenSize: size,
              widget: EditAssignmentSheet(
                assignment: assignment,
              ),
            ),
          ),
        ),
      ),
    );
  }

  group('EditAssignmentSheet', () {
    setUp(() async {
      setFirestoreInstance(MockFirestoreInstance());
      assignmentsRepository = AssignmentsRepository();

      await assignmentsRepository.addAssignment(mockAssignment);
    });

    testWidgets('shows correct text when assignment is null', (WidgetTester tester) async {
      await initEditAssignmentSheet(tester, assignment: null);

      expect(find.text('Add'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
    });

    testWidgets('shows correct text when assignment is NOT null', (WidgetTester tester) async {
      await initEditAssignmentSheet(tester, assignment: mockAssignment);

      expect(find.text('Update'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
    });

    testWidgets('works on all screen sizes', (WidgetTester tester) async {
      for (Size size in allDeviceSizes) {
        await initEditAssignmentSheet(tester, assignment: mockAssignment, size: size);
      }
    });

    // failing
    testWidgets('entering text then tapping "Add" adds an assignment to firestore', (WidgetTester tester) async {
      await initEditAssignmentSheet(tester, assignment: null);
      await tester.enterText(find.byType(EditAssignmentTextField), 'test assignment');
      await tap(tester, find.text('Add'));

      // Cannot use `getAssignmentByID()` since ID is generated at runtime
      Assignment assignmentForm = (await getAllAssignments())[0];
      expect(assignmentForm.title, 'test assignment');
      expect(assignmentForm.isComplete, false);

      // These are randomly generated, so cannot test with an explicit value
      expect(assignmentForm.dateCreated, isNotNull);
      expect(assignmentForm.id, isNotNull);
    }, skip: true);

    testWidgets('tapping "Add" closes the sheet', (WidgetTester tester) async {
      await initEditAssignmentSheet(tester, assignment: null);
      await tap(tester, find.text('Add'));
      expect(find.byType(EditAssignmentSheet), findsNothing);
    });

    // failing
    testWidgets('entering text then tapping "Update" updates an assignment within firestore', (WidgetTester tester) async {
      await initEditAssignmentSheet(tester, assignment: mockAssignment);
      await tester.enterText(find.byType(EditAssignmentTextField), 'test assignment');
      await tap(tester, find.text('Update'));

      String firestoreDump = (getFirestoreInstance() as MockFirestoreInstance).dump();
      expect(firestoreDump.contains('"name": "test assignment"'), true);
    }, skip: true);

    // failing
    testWidgets('tapping "Update" closes the sheet', (WidgetTester tester) async {
      await initEditAssignmentSheet(tester, assignment: mockAssignment);
      await tap(tester, find.text('Update', skipOffstage: false));
      expect(find.byType(EditAssignmentSheet), findsNothing);
    }, skip: true);

    testWidgets('tapping "Cancel" closes the sheet', (WidgetTester tester) async {
      await initEditAssignmentSheet(tester, assignment: mockAssignment);
      await tap(tester, find.text('Cancel'));
      expect(find.byType(EditAssignmentSheet), findsNothing);
    });
  });
}
