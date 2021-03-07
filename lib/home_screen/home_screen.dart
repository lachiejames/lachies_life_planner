import 'package:flutter/material.dart';
import 'package:lachies_life_planner/home_screen/widgets/text_icon_button.dart';
import 'package:lachies_life_planner/shared/size_config.dart';

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
                  onPressed: null,
                  text: 'Tasks',
                  icon: Icons.check,
                ),
                TextIconButton(
                  onPressed: null,
                  text: 'Calendar',
                  icon: Icons.calendar_today,
                ),
              ],
            ),
            _ExpandedRow(
              children: <Widget>[
                TextIconButton(
                  onPressed: null,
                  text: 'Fitness',
                  icon: Icons.directions_run_outlined,
                ),
                TextIconButton(
                  onPressed: null,
                  text: 'Homework',
                  icon: Icons.menu_book_outlined,
                ),
              ],
            ),
            _ExpandedRow(
              children: <Widget>[
                TextIconButton(
                  onPressed: null,
                  text: 'Finance',
                  icon: Icons.attach_money,
                ),
                TextIconButton(
                  onPressed: null,
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
