import 'package:flutter/material.dart';
import 'package:lachies_life_planner/shared/config/size_config.dart';

class TextIconButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final IconData icon;
  final Color color;
  final Color backgroundColor;

  TextIconButton({
    @required this.onPressed,
    @required this.text,
    @required this.icon,
    this.color,
    this.backgroundColor,
  }) : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? Colors.black,
      margin: EdgeInsets.all(screenHeightUnit * 2),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
            padding: EdgeInsets.only(
              top: screenHeightUnit * 4,
              bottom: screenHeightUnit * 4,
            ),
          ),
          onPressed: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: color ?? Colors.white,
                    fontSize: screenWidthUnit * 6,
                  ),
                ),
              ),
              Expanded(
                child: Icon(
                  icon,
                  color: color ?? Colors.white,
                  size: screenWidthUnit * 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
