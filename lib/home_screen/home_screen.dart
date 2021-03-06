import 'package:flutter/material.dart';
import 'package:lachies_life_planner/home_screen/widgets/text_icon_button.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Row(
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
              Row(
                children: <Widget>[
                  TextIconButton(
                    onPressed: null,
                    text: 'Health & Fitness',
                    icon: Icons.directions_run_outlined,
                  ),
                  TextIconButton(
                    onPressed: null,
                    text: 'Homework',
                    icon: Icons.menu_book_outlined,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  TextIconButton(
                    onPressed: null,
                    text: 'Finance',
                    icon: Icons.monetization_on,
                  ),
                  TextIconButton(
                    onPressed: null,
                    text: 'Goals',
                    icon: Icons.help_outlined,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
