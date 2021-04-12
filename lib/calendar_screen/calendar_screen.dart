import 'package:flutter/material.dart';

@immutable
class CalendarScreen extends StatelessWidget {
  const CalendarScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: Container(),
    );
  }
}
