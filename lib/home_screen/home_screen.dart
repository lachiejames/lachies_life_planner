import 'package:flutter/material.dart';
import 'package:lachies_life_planner/home_screen/widgets/text_icon_button.dart';
import 'package:lachies_life_planner/shared/size_config.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                mainAxisAlignment: MainAxisAlignment.center,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
              )
            ],
          ),
        ));
  }
}
