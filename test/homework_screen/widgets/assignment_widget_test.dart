import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/homework_screen/bloc/assignments_bloc.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment.dart';
import 'package:lachies_life_planner/homework_screen/models/assignments_repository.dart';
import 'package:lachies_life_planner/homework_screen/widgets/assignment_widget.dart';
import 'package:lachies_life_planner/homework_screen/widgets/edit_assignment_widget/edit_assignment_sheet.dart';
import 'package:lachies_life_planner/shared/config/firebase_config.dart';

import '../../utils/device_screen_sizes.dart';
import '../../utils/mock_firestore_data.dart';
import '../../utils/repository_operations.dart';
import '../../utils/widget_tester.dart';

void main() {
  AssignmentsRepository assignmentsRepository;

  Future<void> initAssignmentWidget(WidgetTester tester, {Assignment assignment, Size size = samsungGalaxyNote5}) async {
    await assignmentsRepository.addAssignment(assignment);

    await tester.pumpWidget(
      BlocProvider<AssignmentsBloc>(
        create: (BuildContext context) => AssignmentsBloc(assignmentsRepository: assignmentsRepository),
        child: MaterialApp(
          home: Scaffold(
            body: WidgetTestingWrapper(
              screenSize: size,
              widget: AssignmentWidget(
                assignment: assignment,
              ),
            ),
          ),
        ),
      ),
    );
  }

  group('AssignmentWidget', () {
    setUp(() {
      setFirestoreInstance(MockFirestoreInstance());
      assignmentsRepository = AssignmentsRepository();
    });

    testWidgets('displays correct text and icon', (WidgetTester tester) async {
      await initAssignmentWidget(tester, assignment: mockAssignment);

      expect(find.text(mockAssignment.title), findsOneWidget);
      expect(find.byType(Checkbox), findsOneWidget);
    });

    testWidgets('works on all screen sizes', (WidgetTester tester) async {
      for (Size size in allDeviceSizes) {
        await initAssignmentWidget(tester, assignment: mockAssignment, size: size);
      }
    });

    testWidgets('tapping it opens the sheet', (WidgetTester tester) async {
      await initAssignmentWidget(tester, assignment: mockAssignment);

      await tap(tester, find.text(mockAssignment.title));

      expect(find.byType(EditAssignmentSheet), findsOneWidget);
    });

    testWidgets('tapping the checkbox completes the assignment', (WidgetTester tester) async {
      await initAssignmentWidget(tester, assignment: mockAssignment);

      Assignment assignmentBeforeTap = await getAssignmentByID(mockAssignment.id);
      expect(assignmentBeforeTap.isComplete, false);

      await tap(tester, find.byType(Checkbox));

      Assignment assignmentAfterTap = await getAssignmentByID(mockAssignment.id);
      expect(assignmentAfterTap.isComplete, true);
    });
  });
}
