import 'package:flutter/material.dart';
import 'package:lachies_life_planner/shared/config/size_config.dart';

class SheetTextButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  SheetTextButton({@required this.text, @required this.onPressed}) : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(screenWidthUnit * 8),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          onPressed: onPressed,
          child: Text(text),
        ),
      ),
    );
  }
}
