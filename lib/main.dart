import 'package:flutter/material.dart';
import 'package:lachies_life_planner/home_screen/widgets/text_icon_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Wrap(
        // We changed from Row to Wrap
        direction: Axis.horizontal, // we need to specify the direction
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
      ),
    );
  }
}
