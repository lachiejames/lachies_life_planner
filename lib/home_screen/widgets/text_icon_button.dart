import 'package:flutter/material.dart';
import 'package:lachies_life_planner/shared/size_config.dart';

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
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? Colors.black,
      margin: EdgeInsets.all(screenHeightUnit * 2),
      width: screenHeightUnit * 24,
      height: screenHeightUnit * 24,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: color ?? Colors.white,
                  fontSize: screenWidthUnit * 6,
                ),
              ),
              Container(
                height: screenHeightUnit * 4,
              ),
              Icon(
                icon,
                color: color ?? Colors.white,
                size: screenWidthUnit * 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
