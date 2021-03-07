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
                Expanded(
                  child: TextIconButton(
                    onPressed: null,
                    text: 'Tasks',
                    icon: Icons.check,
                  ),
                ),
                Expanded(
                  child: TextIconButton(
                    onPressed: null,
                    text: 'Calendar',
                    icon: Icons.calendar_today,
                  ),
                ),
              ],
            ),
            _ExpandedRow(
              children: <Widget>[
                Expanded(
                  child: TextIconButton(
                    onPressed: null,
                    text: 'Fitness',
                    icon: Icons.directions_run_outlined,
                  ),
                ),
                Expanded(
                  child: TextIconButton(
                    onPressed: null,
                    text: 'Homework',
                    icon: Icons.menu_book_outlined,
                  ),
                ),
              ],
            ),
            _ExpandedRow(
              children: <Widget>[
                Expanded(
                  child: TextIconButton(
                    onPressed: null,
                    text: 'Finance',
                    icon: Icons.attach_money,
                  ),
                ),
                Expanded(
                  child: TextIconButton(
                    onPressed: null,
                    text: 'Goals',
                    icon: Icons.lightbulb,
                  ),
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

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }
}