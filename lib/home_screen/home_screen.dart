import 'package:flutter/material.dart';
import 'package:lachies_life_planner/calendar_screen/calendar_screen.dart';
import 'package:lachies_life_planner/finance_screen/finance_screen.dart';
import 'package:lachies_life_planner/fitness_screen/fitness_screen.dart';
import 'package:lachies_life_planner/goals_screen/goals_screen.dart';
import 'package:lachies_life_planner/home_screen/widgets/text_icon_button.dart';
import 'package:lachies_life_planner/homework_screen/homework_screen.dart';
import 'package:lachies_life_planner/shared/size_config.dart';
import 'package:lachies_life_planner/tasks_screen/tasks_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initSizeConfigurations(MediaQuery.of(context).size);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _ExpandedRow(
              children: <Widget>[
                TextIconButton(
                  onPressed: () => _navigateTo(context, TasksScreen()),
                  text: 'Tasks',
                  icon: Icons.check,
                ),
                TextIconButton(
                  onPressed: () => _navigateTo(context, CalendarScreen()),
                  text: 'Calendar',
                  icon: Icons.calendar_today,
                ),
              ],
            ),
            _ExpandedRow(
              children: <Widget>[
                TextIconButton(
                  onPressed: () => _navigateTo(context, FitnessScreen()),
                  text: 'Fitness',
                  icon: Icons.directions_run_outlined,
                ),
                TextIconButton(
                  onPressed: () => _navigateTo(context, HomeworkScreen()),
                  text: 'Homework',
                  icon: Icons.menu_book_outlined,
                ),
              ],
            ),
            _ExpandedRow(
              children: <Widget>[
                TextIconButton(
                  onPressed: () => _navigateTo(context, FinanceScreen()),
                  text: 'Finance',
                  icon: Icons.attach_money,
                ),
                TextIconButton(
                  onPressed: () => _navigateTo(context, GoalsScreen()),
                  text: 'Goals',
                  icon: Icons.lightbulb,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<T> _navigateTo<T extends Widget>(BuildContext context, T screen) {
  return Navigator.push(context, MaterialPageRoute<T>(builder: (BuildContext context) => screen));
}

class _ExpandedRow extends StatelessWidget {
  final List<Widget> children;

  _ExpandedRow({@required this.children});

  List<Widget> _expandChildren(List<Widget> children) {
    List<Widget> expandedChildren = <Widget>[];

    for (Widget child in children) {
      expandedChildren.add(Expanded(child: child));
    }

    return expandedChildren;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _expandChildren(children),
      ),
    );
  }
}
