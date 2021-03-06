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
      margin: EdgeInsets.all(SizeConfig.blockSizeVertical * 2),
      width: SizeConfig.blockSizeVertical * 24,
      height: SizeConfig.blockSizeVertical * 24,
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
                  fontSize: SizeConfig.blockSizeHorizontal * 6,
                ),
              ),
              Container(
                height: SizeConfig.blockSizeVertical * 4,
                width: SizeConfig.blockSizeVertical * 4,
              ),
              Icon(
                icon,
                color: color ?? Colors.white,
                size: SizeConfig.blockSizeHorizontal * 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
