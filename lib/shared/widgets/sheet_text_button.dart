import 'package:flutter/material.dart';
import 'package:lachies_life_planner/shared/config/size_config.dart';

@immutable
class SheetTextButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const SheetTextButton({@required this.text, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(screenWidthUnit * 8),
      child: Directionality(
        textDirection: TextDirection.ltr,
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
