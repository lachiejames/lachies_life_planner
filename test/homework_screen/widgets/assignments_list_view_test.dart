import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachies_life_planner/homework_screen/bloc/assignments_bloc.dart';
import 'package:lachies_life_planner/homework_screen/bloc/assignments_event.dart';
import 'package:lachies_life_planner/homework_screen/models/assignment.dart';
import 'package:lachies_life_planner/homework_screen/models/assignments_repository.dart';
import 'package:lachies_life_planner/homework_screen/widgets/assignment_widget.dart';
import 'package:lachies_life_planner/homework_screen/widgets/assignments_list_view.dart';
import 'package:lachies_life_planner/shared/config/firebase_config.dart';


import '../../utils/device_screen_sizes.dart';
import '../../utils/mock_firestore_data.dart';
import '../../utils/widget_tester.dart';

void main() {
  AssignmentsRepository assignmentsRepository;
  AssignmentsBloc assignmentsBloc;

  Future<void> initAssignmentsListView(WidgetTester tester, [Size size = samsungGalaxyNote5]) async {
    await tester.pumpWidget(
      BlocProvider<AssignmentsBloc>.value(
        value: assignmentsBloc,
        child: MaterialApp(
          home: Scaffold(
            body: WidgetTestingWrapper(
              screenSize: size,
              widget: const AssignmentsListView(),
            ),
          ),
        ),
      ),
    );
  }

  group('AssignmentsListView', () {
    setUp(() {
      setFirestoreInstance(MockFirestoreInstance());
      assignmentsRepository = AssignmentsRepository();
      assignmentsBloc = AssignmentsBloc(assignmentsRepository: assignmentsRepository);
      assignmentsBloc.add(LoadAssignmentsEvent());
    });

    testWidgets('displays correct text and icon', (WidgetTester tester) async {
      await initAssignmentsListView(tester);
    });

    testWidgets('works on all screen sizes', (WidgetTester tester) async {
      for (Size size in allDeviceSizes) {
        await initAssignmentsListView(tester, size);
      }
    });

    testWidgets('initially shows CircularProgressIndicator', (WidgetTester tester) async {
      await initAssignmentsListView(tester);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('displays all assignment widgets in Firestore', (WidgetTester tester) async {
      // Required for tests involving streams - https://github.com/flutter/flutter/issues/17738#issuecomment-392237064
      await tester.runAsync(() async {
        await initAssignmentsListView(tester);

        for (Assignment assignment in mockAssignmentList) {
          assignmentsBloc.add(AddAssignmentEvent(assignment));
        }

        await flushAllMicrotasks(tester);
        expect(find.byType(AssignmentWidget), findsNWidgets(10));
      });
    });
  });
}
